from django.db import models
from django.contrib.auth.models import User
from search.models import Track


class Room(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    tracks = models.ManyToManyField(Track, through='RoomTrack')


class RoomTrack(models.Model):
    room = models.ForeignKey(Room, on_delete=models.CASCADE)
    track = models.ForeignKey(Track, on_delete=models.CASCADE)
    is_playing = models.BooleanField(default=False)
    vote = models.IntegerField(default=0)