from django.contrib import admin
from django.urls import path, re_path
# from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from django.views.static import serve

from webapp import views
from chat import views as chat

urlpatterns = [
                  # Trang quản trị
                  # Trang admin django
                  path('django/', admin.site.urls),
                  # ------------------
                  # Tổng quan
                  path('admin/', views.admin, name='admin'),
                  path('chat/', chat.chat, name='chat'),
                  # ------------------
                  # Đơn hàng
                  path('admin/donhang/', views.donhang, name='donhang'),
                  path('admin/ctdh/<int:id>/', views.ctdh, name='ctdh'),
                  path('admin/cndh/<int:id>/<str:action>/', views.cndh, name='cndh'),
                  # ------------------
                  # Danh mục
                  path('admin/danhmuc/', views.danhmuc, name='danhmuc'),
                  path('admin/danhmuc/them', views.themdanhmuc, name='themdanhmuc'),
                  path('admin/danhmuc/capnhat/<int:id>/', views.capnhatdanhmuc, name='capnhatdanhmuc'),
                  path('admin/danhmuc/xoa/<int:id>/', views.xoadanhmuc, name='xoadanhmuc'),
                  # ------------------
                  # Sản phẩm
                  path('admin/sanpham/', views.xemsanpham, name='xemsanpham'),
                  path('admin/sanpham/them', views.themsanpham, name='themsanpham'),
                  path('admin/sanpham/sua/<int:id>/', views.suasanpham, name='suasanpham'),
                  # Nhân viên
                  path('admin/nhanvien/', views.nhanvien, name='nhanvien'),
                  path('admin/nhanvien/them', views.themnhanvien, name='themnv'),
                  path('admin/nhanvien/xoa/<int:id>/', views.xoanhanvien, name='xoanv'),
                  path('admin/nhanvien/capnhat/<int:id>/<str:action>/', views.capnhatnhanvien, name='capnhatnv'),
                  # # End trang quản trị

                  # Trang khách hàng
                  path('trangchu/', views.trangchu),
                  path('', views.trangchu, name='trangchu'),
                  path('sanpham/<int:type>/', views.sanpham, name='sanpham'),
                  path('ctsp/<int:id>/', views.ctsanpham, name='ctsp'),
                  path('giohang/', views.giohang, name='giohang'),
                  path('themspgh/<int:id>/', views.themspgh, name='themspgh'),
                  path('themspgh/<int:id>/<int:soluong>/', views.themspgh, name='themspgh'),
                  path('xoaspgh/<int:id>/', views.xoaspgh, name='xoaspgh'),
                  path('thanhtoan/', views.thanhtoan, name='thanhtoan'),
                  path('tttc/<int:id>/', views.tttc, name='tttc'),
                  path('dhtc/', views.thanhtoan, name='dhtc'),
                  path('taikhoan/', views.taikhoan, name='taikhoan'),
                  path('dangky/', views.dangky, name='dangky'),
                  path('dangnhap/', views.dangnhap, name='dangnhap'),
                  path('dangxuat/', views.dangxuat, name='dangxuat'),
                  path('cttk/', views.cttaikhoan, name='cttk'),
                  path('cntk/', views.cntaikhoan, name='cntk'),
                  path('dmk/', views.doimatkhau, name='dmk'),
                  path('timkiem/', views.timkiem, name='timkiem'),
                  # End trang khách hàng
              ] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) \
              + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
