from django.db import models
from django.contrib.auth.models import User


class Track(models.Model):
    track_id = models.CharField(max_length=255)
    track_name = models.CharField(max_length=255)
    artist_name = models.CharField(max_length=255)
    coverArt = models.CharField(max_length=255)
    duration = models.IntegerField()
    playability = models.BooleanField()
    preview_url = models.CharField(max_length=255)

    def get_track(self):
        return f'{self.track_name}- {self.artist_name}'

class UserTrack(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    track = models.ForeignKey(Track, on_delete=models.CASCADE)

    def get_user_track(self):
        return f'{self.user} - {self.track}'