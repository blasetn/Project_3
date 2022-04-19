from django.contrib import messages
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.contrib.postgres.search import SearchVector, SearchQuery
from django.db.models.functions import Coalesce
from django.http import HttpResponse
from django.shortcuts import render, redirect
from decimal import Decimal

from webapp.models import DonHang, DanhMuc, SanPham, HinhSP, CTTK, CTDH, MGG
from .decorators import *


@login_required(login_url='taikhoan')
@ktnv
def admin(request):
    sl_sp = SanPham.objects.all().count()
    sl_dh = DonHang.objects.all().count()
    sl_user = User.objects.filter(is_staff=0).count()
    sl_mgg = MGG.objects.all().count()
    sp_moi = SanPham.objects.all().order_by('-sp_id').values('sp_id', 'sp_ten', 'sp_gia', 'hinhsp__hinhsp_url',
                                                             'sp_vi')[:10]
    dh_moi = DonHang.objects.all().order_by('-dh_id')[:10]
    kh_moi = User.objects.filter(is_staff=0).order_by('-id').values('cttk__cttk_hoten', 'username', 'date_joined')
    return render(request, 'admin/index.html',
                  {
                      'sl_sp': sl_sp,
                      'sl_dh': sl_dh,
                      'sl_user': sl_user,
                      'sl_mgg': sl_mgg,
                      'sp_moi': sp_moi,
                      'dh_moi': dh_moi,
                      'kh_moi': kh_moi
                  })


@login_required(login_url='taikhoan')
@ktnv
def donhang(request):
    dh = DonHang.objects.all().order_by('-dh_id')
    return render(request, 'admin/donhang.html', {'dh': dh})


@login_required(login_url='taikhoan')
@ktnv
def ctdh(request, id=None):
    dh = DonHang.objects.get(pk=id)
    ctdh = CTDH.objects.filter(dh=id)
    return render(request, 'admin/ctdonhang.html',
                  {
                      'dh': dh,
                      'ctdh': ctdh
                  })


@login_required(login_url='taikhoan')
@ktnv
def cndh(request, id, action):
    dh = DonHang.objects.get(pk=id)
    if action == "1":
        dh.dh_trangthai = 1
    if action == "2":
        dh.dh_trangthai = 2
    if action == "3":
        dh.dh_trangthai = 3
    if action == "4":
        dh.dh_trangthai = 4
    dh.save()
    messages.success(request, "Cập nhật đơn hàng " + str(id) + " thành công!")
    return redirect('donhang')


# Danh mục
@login_required(login_url='taikhoan')
@ktadmin
def danhmuc(request):
    dm = DanhMuc.objects.all().order_by('danhmuc_id')
    return render(request, 'admin/danhmuc.html', {'dm': dm})


@login_required(login_url='taikhoan')
@ktadmin
def themdanhmuc(request):
    if request.method == 'POST':
        name = request.POST['name']
        DanhMuc(danhmuc_ten=name).save()
        messages.success(request, "Thêm danh mục thành công!")
    return redirect('danhmuc')


@login_required(login_url='taikhoan')
@ktadmin
def capnhatdanhmuc(request, id):
    dm = DanhMuc.objects.all().order_by('danhmuc_id')
    dm_capnhat = DanhMuc.objects.get(pk=id)
    if request.method == 'POST':
        name = request.POST['name']
        t = DanhMuc.objects.get(pk=id)
        t.danhmuc_ten = name
        t.save()
        messages.success(request, "Cập nhật danh mục thành công!")
        return redirect('danhmuc')
    else:
        return render(request, 'admin/danhmuc_capnhat.html', {'dm': dm, 'dm_capnhat': dm_capnhat})


@login_required(login_url='taikhoan')
@ktadmin
def xoadanhmuc(request, id):
    DanhMuc.objects.get(pk=id).delete()
    messages.success(request, "Xóa danh mục thành công!")
    return redirect('danhmuc')


# Sản phẩm
@login_required(login_url='taikhoan')
@ktadmin
def xemsanpham(request):
    sp = SanPham.objects.all().values('sp_id', 'sp_ten', 'danhmuc__danhmuc_ten', 'sp_gia', 'sp_size', 'sp_vi')
    return render(request, 'admin/sanpham.html', {'sp': sp})


@login_required(login_url='taikhoan')
@ktadmin
def themsanpham(request):
    dm = DanhMuc.objects.all()
    if request.method == 'POST':
        tensp = request.POST['ten']
        gia = request.POST['gia']
        size = request.POST['size']
        vi = request.POST['vi']
        soluong = request.POST['soluong']
        danhmuc_id = DanhMuc.objects.get(pk=request.POST['danhmuc'])
        mota = request.POST['mota']
        SanPham(sp_ten=tensp, sp_gia=gia, sp_size=size, sp_vi=vi, sp_soluong=soluong, danhmuc=danhmuc_id,
                sp_mota=mota).save()
        idspmoi = SanPham.objects.latest('sp_id')
        images = request.FILES.getlist('image')
        for image in images:
            HinhSP(hinhsp_url=image, sp=idspmoi).save()
        messages.success(request, "Thêm sản phẩm thành công!")
        return redirect('xemsanpham')
    else:
        return render(request, 'admin/sanpham_them.html', {'dm': dm})


@login_required(login_url='taikhoan')
@ktadmin
def suasanpham(request, id):
    idsp = SanPham.objects.get(pk=id)
    anh = HinhSP.objects.filter(sp=id)
    dm = DanhMuc.objects.all()
    if request.method == 'POST':
        tensp = request.POST['ten']
        gia = request.POST['gia']
        size = request.POST['size']
        vi = request.POST['vi']
        soluong = request.POST['soluong']
        danhmuc_id = DanhMuc.objects.get(pk=request.POST['danhmuc'])
        mota = request.POST['mota']
        SanPham.objects.filter(pk=id).update(sp_ten=tensp, sp_gia=gia, sp_size=size, sp_vi=vi, sp_soluong=soluong,
                                             danhmuc=danhmuc_id,
                                             sp_mota=mota)
        if request.FILES.get('image', False):
            HinhSP.objects.filter(sp=id).delete()
            images = request.FILES.getlist('image')
            for image in images:
                HinhSP(hinhsp_url=image, sp=idsp).save()
        messages.success(request, "Cập nhật sản phẩm thành công!")
        return redirect('xemsanpham')
    else:
        return render(request, 'admin/sanpham_sua.html', {'idsp': idsp, 'dm': dm, 'anh': anh})


@login_required(login_url='taikhoan')
@ktadmin
def nhanvien(request):
    nv = User.objects.filter(is_staff=1).order_by('id')
    return render(request, 'admin/nhanvien.html', {'nv': nv})


@login_required(login_url='taikhoan')
@ktadmin
def themnhanvien(request):
    if request.method == 'POST':
        tk = request.POST['dk_taikhoan']
        mk = request.POST['dk_matkhau']
        re_mk = request.POST['dk_rematkhau']
        email = request.POST['dk_email']
        quyen = request.POST['quyen']
        user_tk = User.objects.filter(username=tk)
        if user_tk.count() < 1:
            if mk == re_mk:
                user = User.objects.create_user(tk, email, mk)
                if quyen == '0':
                    user.is_superuser = True
                    user.is_staff = True
                if quyen == '1':
                    user.is_staff = True
                user.save()
                u_id = User.objects.get(pk=user.id)
                CTTK(tk=u_id).save()
                messages.success(request, "Thêm nhân viên thành công!")
                return redirect('nhanvien')
            else:
                messages.error(request, "Thêm nhân viên không thành công: Mật khẩu và nhập lại mật khẩu không khớp!")
                return redirect('nhanvien')
        else:
            messages.error(request, "Thêm nhân viên không thành công: Tài khoản đã tồn tại!")
            return redirect('nhanvien')
    return redirect('nhanvien')


@login_required(login_url='taikhoan')
@ktadmin
def capnhatnhanvien(request, id, action):
    user = User.objects.get(pk=id)
    if action == "up":
        user.is_staff = True
        user.is_superuser = True
    if action == "down":
        user.is_staff = True
        user.is_superuser = False
    user.save()
    messages.success(request, "Cập nhật nhân viên (" + user.username + ") thành công!")
    return redirect('nhanvien')


@login_required(login_url='taikhoan')
@ktadmin
def xoanhanvien(request, id):
    User.objects.get(pk=id).delete()
    messages.success(request, "Xóa nhân viên thành công!")
    return redirect('nhanvien')


def nav():
    nav = DanhMuc.objects.all().order_by('danhmuc_id')
    return nav


def slspgh(request):
    sl = 0
    if "giohang" in request.session:
        giohang = request.session['giohang']
        sl = len(giohang)
    return sl


def trangchu(request):
    sp_1 = SanPham.objects.filter(danhmuc=1).values('sp_id', 'sp_ten', 'sp_gia', 'hinhsp__hinhsp_url')[:2]
    sp_2 = SanPham.objects.filter(danhmuc=2).values('sp_id', 'sp_ten', 'sp_gia', 'hinhsp__hinhsp_url')[:2]
    sp_3 = SanPham.objects.filter(danhmuc=3).values('sp_id', 'sp_ten', 'sp_gia', 'hinhsp__hinhsp_url')[:2]
    sp_4 = SanPham.objects.filter(danhmuc=4).values('sp_id', 'sp_ten', 'sp_gia', 'hinhsp__hinhsp_url')[:2]
    return render(request, 'user/trangchu.html',
                  {
                      'nav': nav(),
                      'slsp': slspgh(request),
                      'sp1': sp_1,
                      'sp2': sp_2,
                      'sp3': sp_3,
                      'sp4': sp_4,
                  })


def sanpham(request, type=None):
    if type == 0:
        sp_list = SanPham.objects.all().values('sp_id', 'sp_ten', 'sp_gia', 'sp_soluong',
                                               'sp_vi', 'sp_size', 'sp_mota', 'danhmuc__danhmuc_ten',
                                               'hinhsp__hinhsp_url')
    else:
        sp_list = SanPham.objects.filter(danhmuc=type).values('sp_id', 'sp_ten', 'sp_gia', 'sp_soluong',
                                                              'sp_vi', 'sp_size', 'sp_mota', 'danhmuc__danhmuc_ten',
                                                              'hinhsp__hinhsp_url')
    return render(request, 'user/sanpham.html',
                  {
                      'nav': nav(),
                      'slsp': slspgh(request),
                      'sp': sp_list
                  })


def ctsanpham(request, id=None):
    ctsp = SanPham.objects.filter(sp_id=id).values('sp_id', 'sp_ten', 'sp_gia', 'sp_soluong',
                                                   'sp_vi', 'sp_size', 'sp_mota', 'danhmuc__danhmuc_ten',
                                                   'hinhsp__hinhsp_url', 'danhmuc')
    ctsp_moi = SanPham.objects.all().order_by('-sp_id').values('sp_id', 'sp_ten', 'sp_gia', 'sp_soluong',
                                                               'sp_vi', 'sp_size', 'sp_mota',
                                                               'danhmuc__danhmuc_ten',
                                                               'hinhsp__hinhsp_url', 'danhmuc')[:4]
    return render(request, 'user/ctsanpham.html',
                  {
                      'nav': nav(),
                      'slsp': slspgh(request),
                      'ctsp': ctsp,
                      'ctsp_moi': ctsp_moi
                  })


def giohang(request):
    giohang = []
    tongtienhang = tongthanhtoan = 0.0
    ship = 30000
    giamgia = 0
    if "giohang" in request.session:
        giohang = request.session['giohang']
        for item in giohang:
            tongtienhang += item.get('gia') * float(item.get('soluong'))
        tongthanhtoan = tongtienhang + ship - giamgia
    return render(request, 'user/giohang.html',
                  {
                      'nav': nav(),
                      'slsp': slspgh(request),
                      'giohang': giohang,
                      'tongtienhang': tongtienhang,
                      'tongthanhtoan': tongthanhtoan,
                      'ship': ship,
                      'giamgia': giamgia
                  })


def themspgh(request, id=None, soluong=None):
    sp = SanPham.objects.filter(sp_id=id).values('sp_id', 'sp_ten', 'sp_gia', 'sp_soluong',
                                                 'sp_vi', 'sp_size', 'hinhsp__hinhsp_url')[:1]
    giohang = []
    if "giohang" in request.session:
        giohang = request.session['giohang']
    giohangmoi = []
    kiemtra = False
    if soluong is None:
        soluong = 1
    else:
        soluong = -1
    for spgiohang in giohang:
        idspgiohang = spgiohang.get('id')
        for item in sp:
            if idspgiohang == item['sp_id']:
                kiemtra = True
                if request.method == 'POST':
                    soluong = request.POST['soluong']
                    messages.success(request, "Thêm sản phẩm thành công!")
                spgiohang['soluong'] = int(spgiohang['soluong']) + int(soluong)
                if spgiohang['soluong'] < 1:
                    spgiohang['soluong'] = 1
                if spgiohang['soluong'] > item['sp_soluong']:
                    spgiohang['soluong'] = item['sp_soluong']
                    messages.error(request, "Số lượng của sản phẩm trong giỏ hàng đã bằng số lượng sản phẩm sẵn có!")
                else:
                    messages.success(request, "Thao tác thành công!")
            giohangmoi.append(spgiohang)
    if kiemtra == False:
        if request.method == 'POST':
            soluong = request.POST['soluong']
        for item in sp:
            giohangmoi.append({
                'id': item['sp_id'],
                'ten': item['sp_ten'],
                'gia': float(item['sp_gia']),
                'vi': item['sp_vi'],
                'size': item['sp_size'],
                'hinh': item['hinhsp__hinhsp_url'],
                'soluong': int(soluong)
            })
        messages.success(request, "Thao tác thành công!")
    request.session['giohang'] = giohangmoi
    return redirect(request.META.get('HTTP_REFERER'))


def xoaspgh(request, id=None):
    giohang = []
    giohangmoi = []
    if "giohang" in request.session:
        giohang = request.session['giohang']
    for spgiohang in giohang:
        idspgiohang = spgiohang.get('id')
        if idspgiohang != id:
            giohangmoi.append(spgiohang)
    request.session['giohang'] = giohangmoi
    return redirect(request.META.get('HTTP_REFERER'))


def thanhtoan(request):
    cttk = None
    giohang = []
    if "giohang" in request.session:
        giohang = request.session['giohang']
    tongtienhang = ship = giamgia = tongthanhtoan = 0.0
    if request.method == 'GET':
        if request.user.is_authenticated:
            id_u = request.user.id
            cttk = CTTK.objects.get(pk=id_u)
        tongtienhang = request.GET['tongtienhang']
        ship = request.GET['ship']
        giamgia = request.GET['giamgia']
        tongthanhtoan = request.GET['tongthanhtoan']
        return render(request, 'user/thanhtoan.html',
                      {
                          'nav': nav(),
                          'slsp': slspgh(request),
                          'giohang': giohang,
                          'tongtienhang': tongtienhang,
                          'tongthanhtoan': tongthanhtoan,
                          'cttk': cttk,
                          'ship': ship,
                          'giamgia': giamgia
                      })
    elif request.method == 'POST':
        if request.user.is_authenticated:
            id_u = request.user.id
            cttk = CTTK.objects.get(pk=id_u)
        hoten = request.POST['hoten']
        sdt = request.POST['sdt']
        diachi = request.POST['diachi']
        email = request.POST['email']
        tongtienhang = request.POST['tongtienhang']
        ship = request.POST['ship']
        giamgia = request.POST['giamgia']
        tongthanhtoan = request.POST['tongthanhtoan']
        dh = DonHang(dh_hoten=hoten, dh_sdt=sdt, dh_diachi=diachi, dh_email=email, dh_tienhang=Decimal(tongtienhang),
                     dh_ship=Decimal(ship), dh_tongtien=Decimal(tongthanhtoan), dh_giamgia=Decimal(giamgia),
                     dh_thanhtoan=0, dh_trangthai=0)
        dh.save()
        id_dh = dh.dh_id
        if request.user.is_authenticated:
            user = User.objects.get(pk=id_u)
            tk_dh = DonHang.objects.get(pk=id_dh)
            tk_dh.tk = user
            tk_dh.save()
        for item in giohang:
            sp = SanPham.objects.get(pk=item.get('id'))
            dh = DonHang.objects.get(pk=id_dh)
            CTDH(ctdh_tensp=item.get('ten'), ctdh_vi=item.get('vi'), ctdh_size=item.get('size'),
                 ctdh_soluong=item.get('soluong'), ctdh_gia=item.get('gia'), sp=sp, dh=dh).save()
            sp.sp_soluong -= item.get('soluong')
            sp.save()
        del request.session['giohang']
        return redirect('tttc', id=id_dh)
    else:
        return redirect(request.META.get('HTTP_REFERER'))


def tttc(request, id=None):
    dh = DonHang.objects.get(pk=id)
    ctdh = CTDH.objects.filter(dh=id)
    return render(request, 'user/dathangthanhcong.html',
                  {
                      'nav': nav(),
                      'slsp': slspgh(request),
                      'dh': dh,
                      'ctdh': ctdh
                  })


def taikhoan(request):
    return render(request, 'user/taikhoan.html',
                  {
                      'nav': nav(),
                      'slsp': slspgh(request),
                  })


def dangky(request):
    if request.method == 'POST':
        tk = request.POST['dk_taikhoan']
        mk = request.POST['dk_matkhau']
        re_mk = request.POST['dk_rematkhau']
        email = request.POST['dk_email']
        user_tk = User.objects.filter(username=tk)
        if user_tk.count() < 1:
            if mk == re_mk:
                user = User.objects.create_user(tk, email, mk)
                user.save()
                u_id = User.objects.get(pk=user.id)
                CTTK(tk=u_id).save()
                messages.success(request, "Đăng ký thành công!")
                return redirect('taikhoan')
            else:
                messages.error(request, "Đăng ký không thành công: Mật khẩu và nhập lại mật khẩu không khớp!")
                return redirect('taikhoan')
        else:
            messages.error(request, "Đăng ký không thành công: Tài khoản đã tồn tại!")
            return redirect('taikhoan')
    return redirect('taikhoan')


def dangnhap(request):
    if request.method == 'POST':
        username = request.POST['dn_taikhoan']
        password = request.POST['dn_matkhau']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
        else:
            messages.error(request, "Đăng nhập không thành công: Sai tài khoản hoặc mật khẩu!")
            return redirect('taikhoan')
    return redirect('trangchu')


def dangxuat(request):
    logout(request)
    return redirect('trangchu')


def cttaikhoan(request):
    if request.user.is_authenticated:
        user_id = request.user.id
        user_detail = CTTK.objects.get(pk=user_id)
        dh = DonHang.objects.filter(tk=user_id)
        return render(request, 'user/cttaikhoan.html',
                      {
                          'nav': nav(),
                          'slsp': slspgh(request),
                          'cttk': user_detail,
                          'dh': dh
                      })
    else:
        return redirect('taikhoan')


def cntaikhoan(request):
    id_dn = request.user.id
    if request.method == 'POST':
        hoten = request.POST['hoten']
        hinh = request.FILES['hinh']
        gioitinh = request.POST['gioitinh']
        ngaysinh = request.POST['ngaysinh']
        sdt = request.POST['sdt']
        email = request.POST['email']
        diachi = request.POST['diachi']
        CTTK.objects.filter(pk=id_dn).update(cttk_hoten=hoten, cttk_gioitinh=gioitinh, cttk_ngaysinh=ngaysinh,
                                             cttk_sdt=sdt, cttk_diachi=diachi)
        cttk = CTTK.objects.get(pk=id_dn)
        cttk.cttk_avatar = hinh
        cttk.save()
        user = User.objects.get(pk=id_dn)
        user.email = email
        user.save()
    return redirect('cttk')


def doimatkhau(request):
    if request.method == 'POST':
        mk_cu = request.POST['mk_cu']
        mk_moi = request.POST['mk_moi']
        re_mk_moi = request.POST['re_mk_moi']
        user = authenticate(request, username=request.user.username, password=mk_cu)
        if user is not None:
            if mk_moi == re_mk_moi:
                user.set_password(mk_moi)
                user.save()
                messages.success(request, "Đổi mật khẩu thành công!")
                return redirect('cttk')
            else:
                messages.error(request, "Đổi mật khẩu không thành công: Mật khẩu và nhập lại mật khẩu không khớp!")
                return redirect('cttk')
        else:
            messages.error(request, "Đổi mật khẩu không thành công: Mật khẩu cũ không đúng!")
            return redirect('cttk')
    return redirect('cttk')


def timkiem(request):
    kq = None
    if request.method == 'POST':
        key_search = request.POST['key_search']
        vector = SearchVector('sp_ten', 'sp_mota')
        query = SearchQuery(key_search)
        kq = SanPham.objects.annotate(search=vector).filter(search=query).values('sp_id', 'sp_ten', 'sp_gia',
                                                                                 'hinhsp__hinhsp_url')
        if not kq:
            kq = None
    return render(request, 'user/timkiem.html',
                  {
                      'nav': nav(),
                      'kq': kq,
                      'slsp': slspgh(request),
                  })
