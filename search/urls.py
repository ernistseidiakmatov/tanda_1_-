from django.urls import path
from . import views


urlpatterns = [
    path('search', views.search, name="search"),  
    path('searchTrack', views.searchTrack, name="searchTrack"),  
    # path("add-track", views.add_track, name='add_track'),
    # path('search-track', views.search_track, name="search-track"),

]