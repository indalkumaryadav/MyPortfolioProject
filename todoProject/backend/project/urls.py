from django.contrib import admin
from django.urls import path,include
from todo.views import TodoViewSet
from rest_framework import routers

router = routers.DefaultRouter()
router.register("todos",TodoViewSet,basename="todo")

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include(router.urls)),
]
