from django import forms

class SearchForm(forms.Form):
    search_input = forms.CharField(label="Search for your song", max_length=100)