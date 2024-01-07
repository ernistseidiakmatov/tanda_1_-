from django.urls import path
from . import views


urlpatterns = [
    # path('player-voter', views.playerVoter, name="player_voter"),
    path('', views.player, name="player"),
    path('next', views.next_track, name="next_track")
    # path('voter/<str:username>', views.vote_tracks, name='vote_tracks'),

  

]
