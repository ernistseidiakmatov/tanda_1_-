from django.shortcuts import render, redirect, reverse
import requests
from .forms import SearchForm

from .models import UserTrack, Track
from django.contrib.auth.decorators import login_required

# Create your views here.

@login_required
def search(request):
    return render(request, 'search/search.html', {"r":"hello world"})


@login_required
def searchTrack(request):
    form = request.GET.get('search-input', '')
    # if request == 'POST':
    #     form = request.POST['search-input']
    #     return render(request, 'search/search.html', {'p': form})

    newQuer = form.replace(" ", "+")

    search_url = "https://spotify23.p.rapidapi.com/search/"

    querystring = {"q":newQuer,"type":"tracks","offset":"0","limit":"10","numberOfTopResults":"5"}


    headers = {
        "X-RapidAPI-Key": "d23b18a39amsh8ab41f8a38d3bf7p1bce31jsn7762c2aa93e5",
        # "X-RapidAPI-Key": "7f4f269514msh2112fdab8bdc3d1p1fb802jsne8383709a3e6",
        "X-RapidAPI-Host": "spotify23.p.rapidapi.com"
    }

    search_tracks = requests.get(search_url, headers=headers, params=querystring)

    data = search_tracks.json()

    results = []

    preview_url = "https://spotify23.p.rapidapi.com/tracks/"

    for track in data['tracks']['items']:
        item_data = {
            # 'uri': track['data']['uri'],
            'id': track['data']['id'],
            'name': track['data']['name'],
            'coverArt': track['data']['albumOfTrack']['coverArt']['sources'][0]['url'],
            'artists': [artist['profile'] for artist in track['data']['artists']['items']],
            'durationMillis': track['data']['duration']['totalMilliseconds'],
            'playability': track['data']['playability']['playable'],
            'preview_url': requests.get(preview_url, headers=headers, params={"ids":track['data']['id']}).json()["tracks"][0]["preview_url"]
        }
        results.append(item_data)

    if request.method == "POST":
            
        if request.method == 'POST':
            track_id = request.POST['id']
            track_name = request.POST['name']
            artist_name = request.POST['artist']
            coverArt = request.POST['coverArt'] 
            duration = request.POST['duration']
            playability = request.POST['playability']
            preview_url = request.POST['preview_url']

            user = request.user

            track = Track()

            if not Track.objects.filter(track_id=track_id).exists():

                track = Track.objects.create(
                    track_id = track_id,
                    track_name = track_name,
                    artist_name = artist_name,
                    coverArt = coverArt,
                    duration = duration,
                    playability = playability,
                    preview_url = preview_url
                )

                UserTrack.objects.create(
                    user = user,
                    track = track
                )

                
                return render(request, 'search/search.html', {'songs':results })
                
            else:
                return render(request, 'search/search.html', {'songs':results })

        return render(request, 'search/search.html', {'songs':results })

    return render(request, 'search/search.html', {'songs':results })


# def add_track(request):
#     if request.method == 'POST':
#         track_id = request.POST['id']
#         track_name = request.POST['name']
#         artist_name = request.POST['artist']
#         coverArt = request.POST['coverArt'] 
#         duration = request.POST['duration']
#         playability = request.POST['playability']
#         preview_url = request.POST['preview_url']

#         user = request.user

#         track = Track()

#         if not Track.objects.filter(track_id=track_id).exists():

#             track = Track.objects.create(
#                 track_id = track_id,
#                 track_name = track_name,
#                 artist_name = artist_name,
#                 coverArt = coverArt,
#                 duration = duration,
#                 playability = playability,
#                 preview_url = preview_url
#             )

#             UserTrack.objects.create(
#                 user = user,
#                 track = track
#             )

            
#             return redirect('searchTrack')
            
#         else:
#             return redirect('searchTrack')

#     return render(request, 'searchTrack')