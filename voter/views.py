from django.shortcuts import render
from player.models import Room, RoomTrack
from search.models import UserTrack, User, Track
import ast, random

# Create your views here.


def vote(request, username):
    username = username

    user = User.objects.get(username=username)

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

        vote_for = Track.objects.get(track_id=playing_next)

        vote_data = {
            'track_name': vote_for.track_name,
            'artists': ast.literal_eval(vote_for.artist_name),
        }


        return render (request, "voter/voti.html", {'vote': vote_data})

    return render(request, "voter/voti.html", {'songs': result})

