from django.shortcuts import render,redirect
from .models import *
from django.http import HttpResponse
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth import authenticate,login,logout
from django.contrib.auth.decorators import login_required


# ========================== Insert Receipes ==========================================
@login_required(login_url="/login/")
def receipes_view(request):
    if request.method == "POST":
        data = request.POST

        receipe_image = request.FILES.get('receipe_image')
        receipe_name = data.get('receipe_name')
        receipe_description = data.get('receipe_description')
        print(receipe_name)
        print(receipe_description)
        print(receipe_image)

        Receipe.objects.create(
            receipe_image = receipe_image,
            receipe_name = receipe_name,
            receipe_description = receipe_description,
        )
        
        return redirect('/receipes_view/')
    

    queryset = Receipe.objects.all()

    if request.GET.get('search'):
        queryset = queryset.filter(receipe_name__icontains = request.GET.get('search'))


    context = {'receipes':queryset}
    return render(request, 'receipes.html',context)
# ====================================================================================


# ================================ Update Receipes ======================================= 
@login_required(login_url="/login/")
def update_receipe(request,id):
    queryset = Receipe.objects.get(id = id)

    if request.method == "POST":
        data = request.POST

        receipe_image = request.FILES.get('receipe_image')
        receipe_name = data.get('receipe_name')
        receipe_description = data.get('receipe_description')

        queryset.receipe_name = receipe_name
        queryset.receipe_description = receipe_description

        if receipe_image:
            queryset.receipe_image = receipe_image

        queryset.save()
        return redirect('/receipes_view/')


    context = {'receipes':queryset}
    return render(request, 'update_receipes.html',context)
# =====================================================================================


# =============================== Delete Receipes ======================================== 
@login_required(login_url="/login/")
def delete_receipe(request,id):
    queryset = Receipe.objects.get(id = id)
    queryset.delete()    
    return redirect('/receipes_view/')

# ================================== Login User =========================================
def login_page(request):
    if request.method == "POST":
        username = request.POST.get('username')
        password = request.POST.get('password')

        if not User.objects.filter(username = username).exists():
            messages.error(request, "Inavlid Username")
            return redirect('/login/')
        
        user = authenticate(username = username , password=password)
        
        if user is None:
            messages.error(request, "Inavlid Password")
            return redirect('/login/')
        
        else:
            login(request,user)
            return redirect('/receipes_view/')


    return render(request,'login.html')
# =========================================================================================

# ======================================== Logout Usre ========================================
def logout_page(request):
    logout(request)
    return redirect('/login/')

# ===========================================================================================

# ====================================== Register User =====================================
def register(request):
    if request.method == "POST":
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        username = request.POST.get('username')
        password = request.POST.get('password')

        user = User.objects.filter(username = username)

        if user.exists():
            messages.error(request, "Username allready Taken")
            return redirect('/register/')

    
        user = User.objects.create(
        first_name = first_name,
        last_name = last_name,
        username = username,
    )
     
        user.set_password( password)
        user.save()

        messages.error(request, "Account Created Successfully")
        return redirect('/register/')

    return render(request,'register.html')

#  ========================================================================================
