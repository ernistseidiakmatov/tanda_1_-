from django.shortcuts import render, redirect
from .models import Room, RoomTrack, User
from search.models import UserTrack, Track
import random, ast
from django.contrib.auth.decorators import login_required
# Create your views here.


@login_required
def player(request):
    user = request.user

    try:
        room = Room.objects.get(user=user)
    except Room.DoesNotExist:
        room = Room.objects.create(user=user)

    try:
        room_track = RoomTrack.objects.filter(room_id=room.id)

        result = []

        for track in room_track:
            p_track = track.track
            
            data = {
                'track_id': p_track.track_id,
                'track_name': p_track.track_name,
                
                'artists': ast.literal_eval(p_track.artist_name),
                'coverArt': p_track.coverArt,
                'preview_url': p_track.preview_url,
                'is_playing': track.is_playing,
                'vote': track.vote
            }
            result.append(data)

    except RoomTrack.DoesNotExist:
        user_tracks = UserTrack.objects.filter(user_id=user.id)
        random_tracks = random.sample(list(user_tracks), 7)
        random_one = random.randint(0, 6)
        count = 0

        for random_track in random_tracks:
            track = random_track.track
            playing = 1 if random_one == count else 0
            RoomTrack.objects.create(is_playing=playing, room=room, track=track)
            count += 1

    if request.method == 'POST':
        playing_next = request.POST.get('flexRadioDefault')

        room_track = RoomTrack.objects.get(track__track_id=playing_next)
        room_track.vote += 1
        room_track.save()


        return render (request, "player/voter.html", {'vote':playing_next})

    return render(request, "player/voter.html", {'songs': result})



@login_required
def next_track(request):
    
    user = request.user
    room = Room.objects.get(user=user)
    most_voted = RoomTrack.objects.filter(room_id=room.id).order_by('-vote').first()  
    
    if most_voted.vote == 0:
        RoomTrack.objects.filter(room_id=room).delete()
        user_tracks = UserTrack.objects.filter(user_id=user.id)
        random_tracks = random.sample(list(user_tracks), 7)
        random_one = random.randint(0, 6)
        count = 0

        for random_track in random_tracks:
            track = random_track.track
            playing = 1 if random_one == count else 0
            RoomTrack.objects.create(is_playing=playing, room=room, track=track)
            count += 1
        return redirect('player')

    next_track_id = most_voted.track.track_id

    track = RoomTrack.objects.get(track__track_id=next_track_id)
    track.is_playing = True
    track.vote = 0
    RoomTrack.objects.exclude(track__track_id=next_track_id).delete()
    track.save()

    user_tracks = UserTrack.objects.filter(user_id=user.id)
    random_tracks = random.sample(list(user_tracks), 6)

    for random_track in random_tracks:
        track = random_track.track
        RoomTrack.objects.create(is_playing=0, room=room, track=track)
        
    return redirect('player')






