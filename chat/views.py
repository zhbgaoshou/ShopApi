from django.shortcuts import render


# Create your views here.
def index(request):
    room = request.GET.get('room')
    return render(request, 'chat.html', {'room': room})
