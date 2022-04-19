from django.contrib.auth.models import User
from django.db import models


class CTTK(models.Model):
    tk = models.OneToOneField(User, on_delete=models.CASCADE, primary_key=True)
    cttk_hoten = models.CharField(max_length=250, null=True)
    cttk_gioitinh = models.BooleanField(null=True)
    cttk_ngaysinh = models.DateField(null=True)
    cttk_sdt = models.CharField(max_length=11, null=True)
    cttk_diachi = models.CharField(max_length=250, null=True)
    cttk_avatar = models.ImageField(null=True)


class DanhMuc(models.Model):
    danhmuc_id = models.BigAutoField(primary_key=True)
    danhmuc_ten = models.CharField(max_length=250, null=True)


class SanPham(models.Model):
    sp_id = models.BigAutoField(primary_key=True)
    sp_ten = models.CharField(max_length=250, null=True)
    sp_mota = models.TextField(null=True)
    sp_trangthai = models.CharField(default=0, max_length=20, null=True)
    sp_luotxem = models.PositiveBigIntegerField(default=0)
    sp_ngaytao = models.DateTimeField(auto_now=False, auto_now_add=True)
    sp_size = models.CharField(max_length=20, null=True)
    sp_vi = models.CharField(max_length=20, null=True)
    sp_soluong = models.PositiveSmallIntegerField(default=0)
    sp_gia = models.DecimalField(max_digits=99, decimal_places=2)
    danhmuc = models.ForeignKey(DanhMuc, on_delete=models.CASCADE)


class HinhSP(models.Model):
    hinhsp_id = models.BigAutoField(primary_key=True)
    hinhsp_url = models.ImageField()
    sp = models.ForeignKey(SanPham, on_delete=models.CASCADE)


class DonHang(models.Model):
    dh_id = models.BigAutoField(primary_key=True)
    tk = models.ForeignKey(User, on_delete=models.CASCADE, null=True)
    dh_thoigian = models.DateTimeField(auto_now=False, auto_now_add=True)
    dh_thanhtoan = models.CharField(max_length=5, default=0)
    dh_trangthai = models.CharField(max_length=5, null=True, default=0)
    dh_tienhang = models.DecimalField(max_digits=99, decimal_places=2)
    dh_ship = models.DecimalField(max_digits=99, decimal_places=2)
    dh_giamgia = models.DecimalField(max_digits=99, decimal_places=2)
    dh_tongtien = models.DecimalField(max_digits=99, decimal_places=2)
    dh_hoten = models.CharField(max_length=250)
    dh_sdt = models.CharField(max_length=11)
    dh_diachi = models.CharField(max_length=250)
    dh_email = models.EmailField(null=True)


class CTDH(models.Model):
    ctdh_id = models.BigAutoField(primary_key=True)
    ctdh_tensp = models.CharField(max_length=250)
    ctdh_vi = models.CharField(max_length=20)
    ctdh_size = models.CharField(max_length=20)
    ctdh_soluong = models.PositiveSmallIntegerField()
    ctdh_gia = models.DecimalField(max_digits=99, decimal_places=2)
    sp = models.ForeignKey(SanPham, on_delete=models.CASCADE)
    dh = models.ForeignKey(DonHang, on_delete=models.CASCADE)


class MGG(models.Model):
    mgg_id = models.BigAutoField(primary_key=True)
    mgg_mgg = models.CharField(max_length=250)
    mgg_giatri = models.FloatField()
    mgg_thoihan = models.DateTimeField(null=True)
