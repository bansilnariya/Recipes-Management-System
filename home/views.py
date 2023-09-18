from django.shortcuts import render

from django.http import HttpResponse

def home(request):
    peoples=[
        {'name':'bansil','age':10},
        {'name':'meet','age':22},
        {'name':'ram','age':15},
        {'name':'pratik','age':22},
        {'name':'sandeep','age':18},
    ]

    
    

    return render(request,"home/index.html",context={'page':'Bn Graphics Design ','peoples':peoples},)
    

def about(request):
    context = {'page':'About'}
    return render(request,"about.html",context)


def contact(request):
    context = {'page':"Contact"}
    return render(request,"contact.html",context)

# def base(request):
#     return render(request,"home/base.html")

def success_page(request):
    print("*" * 10)
    return HttpResponse("<h1>Hey this is a success page</h1>")




