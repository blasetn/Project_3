PGDMP                           z         	   pandacake    14.1    14.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25783 	   pandacake    DATABASE     m   CREATE DATABASE pandacake WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE pandacake;
                postgres    false            �            1259    25810 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    25809    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    216            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            �            1259    25819    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    25818    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    218            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            �            1259    25803    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    25802    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    214            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            �            1259    25826 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    postgres    false            �            1259    25835    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    postgres    false            �            1259    25834    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          postgres    false    222            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          postgres    false    221            �            1259    25825    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          postgres    false    220            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          postgres    false    219            �            1259    25842    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    postgres    false            �            1259    25841 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          postgres    false    224            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          postgres    false    223            �            1259    25938    chat_chatmessage    TABLE     �   CREATE TABLE public.chat_chatmessage (
    id bigint NOT NULL,
    message text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    thread_id bigint,
    user_id integer NOT NULL
);
 $   DROP TABLE public.chat_chatmessage;
       public         heap    postgres    false            �            1259    25937    chat_chatmessage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.chat_chatmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.chat_chatmessage_id_seq;
       public          postgres    false    230            �           0    0    chat_chatmessage_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.chat_chatmessage_id_seq OWNED BY public.chat_chatmessage.id;
          public          postgres    false    229            �            1259    25931    chat_thread    TABLE     �   CREATE TABLE public.chat_thread (
    id bigint NOT NULL,
    updated timestamp with time zone NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    first_person_id integer,
    second_person_id integer
);
    DROP TABLE public.chat_thread;
       public         heap    postgres    false            �            1259    25930    chat_thread_id_seq    SEQUENCE     {   CREATE SEQUENCE public.chat_thread_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.chat_thread_id_seq;
       public          postgres    false    228            �           0    0    chat_thread_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.chat_thread_id_seq OWNED BY public.chat_thread.id;
          public          postgres    false    227            �            1259    25901    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    25900    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    226            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    225            �            1259    25794    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    25793    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            �            1259    25785    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    25784    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            �            1259    25972    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    26030    webapp_ctdh    TABLE     �  CREATE TABLE public.webapp_ctdh (
    ctdh_id bigint NOT NULL,
    ctdh_tensp character varying(250) NOT NULL,
    ctdh_vi character varying(20) NOT NULL,
    ctdh_size character varying(20) NOT NULL,
    ctdh_soluong smallint NOT NULL,
    ctdh_gia numeric(99,2) NOT NULL,
    dh_id bigint NOT NULL,
    sp_id bigint NOT NULL,
    CONSTRAINT webapp_ctdh_ctdh_soluong_check CHECK ((ctdh_soluong >= 0))
);
    DROP TABLE public.webapp_ctdh;
       public         heap    postgres    false            �            1259    26029    webapp_ctdh_ctdh_id_seq    SEQUENCE     �   CREATE SEQUENCE public.webapp_ctdh_ctdh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.webapp_ctdh_ctdh_id_seq;
       public          postgres    false    244            �           0    0    webapp_ctdh_ctdh_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.webapp_ctdh_ctdh_id_seq OWNED BY public.webapp_ctdh.ctdh_id;
          public          postgres    false    243            �            1259    25981    webapp_cttk    TABLE       CREATE TABLE public.webapp_cttk (
    tk_id integer NOT NULL,
    cttk_hoten character varying(250),
    cttk_gioitinh boolean,
    cttk_ngaysinh date,
    cttk_sdt character varying(11),
    cttk_diachi character varying(250),
    cttk_avatar character varying(100)
);
    DROP TABLE public.webapp_cttk;
       public         heap    postgres    false            �            1259    25989    webapp_danhmuc    TABLE     o   CREATE TABLE public.webapp_danhmuc (
    danhmuc_id bigint NOT NULL,
    danhmuc_ten character varying(250)
);
 "   DROP TABLE public.webapp_danhmuc;
       public         heap    postgres    false            �            1259    25988    webapp_danhmuc_danhmuc_id_seq    SEQUENCE     �   CREATE SEQUENCE public.webapp_danhmuc_danhmuc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.webapp_danhmuc_danhmuc_id_seq;
       public          postgres    false    234            �           0    0    webapp_danhmuc_danhmuc_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.webapp_danhmuc_danhmuc_id_seq OWNED BY public.webapp_danhmuc.danhmuc_id;
          public          postgres    false    233            �            1259    26021    webapp_donhang    TABLE     '  CREATE TABLE public.webapp_donhang (
    dh_id bigint NOT NULL,
    dh_thoigian timestamp with time zone NOT NULL,
    dh_thanhtoan character varying(5) NOT NULL,
    dh_trangthai character varying(5),
    dh_tienhang numeric(99,2) NOT NULL,
    dh_ship numeric(99,2) NOT NULL,
    dh_giamgia numeric(99,2) NOT NULL,
    dh_tongtien numeric(99,2) NOT NULL,
    dh_hoten character varying(250) NOT NULL,
    dh_sdt character varying(11) NOT NULL,
    dh_diachi character varying(250) NOT NULL,
    dh_email character varying(254),
    tk_id integer
);
 "   DROP TABLE public.webapp_donhang;
       public         heap    postgres    false            �            1259    26020    webapp_donhang_dh_id_seq    SEQUENCE     �   CREATE SEQUENCE public.webapp_donhang_dh_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.webapp_donhang_dh_id_seq;
       public          postgres    false    242            �           0    0    webapp_donhang_dh_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.webapp_donhang_dh_id_seq OWNED BY public.webapp_donhang.dh_id;
          public          postgres    false    241            �            1259    26014    webapp_hinhsp    TABLE     �   CREATE TABLE public.webapp_hinhsp (
    hinhsp_id bigint NOT NULL,
    hinhsp_url character varying(100) NOT NULL,
    sp_id bigint NOT NULL
);
 !   DROP TABLE public.webapp_hinhsp;
       public         heap    postgres    false            �            1259    26013    webapp_hinhsp_hinhsp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.webapp_hinhsp_hinhsp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.webapp_hinhsp_hinhsp_id_seq;
       public          postgres    false    240            �           0    0    webapp_hinhsp_hinhsp_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.webapp_hinhsp_hinhsp_id_seq OWNED BY public.webapp_hinhsp.hinhsp_id;
          public          postgres    false    239            �            1259    25996 
   webapp_mgg    TABLE     �   CREATE TABLE public.webapp_mgg (
    mgg_id bigint NOT NULL,
    mgg_mgg character varying(250) NOT NULL,
    mgg_giatri double precision NOT NULL,
    mgg_thoihan timestamp with time zone
);
    DROP TABLE public.webapp_mgg;
       public         heap    postgres    false            �            1259    25995    webapp_mgg_mgg_id_seq    SEQUENCE     ~   CREATE SEQUENCE public.webapp_mgg_mgg_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.webapp_mgg_mgg_id_seq;
       public          postgres    false    236            �           0    0    webapp_mgg_mgg_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.webapp_mgg_mgg_id_seq OWNED BY public.webapp_mgg.mgg_id;
          public          postgres    false    235            �            1259    26003    webapp_sanpham    TABLE     .  CREATE TABLE public.webapp_sanpham (
    sp_id bigint NOT NULL,
    sp_ten character varying(250),
    sp_mota text,
    sp_trangthai character varying(20),
    sp_luotxem bigint NOT NULL,
    sp_ngaytao timestamp with time zone NOT NULL,
    sp_size character varying(20),
    sp_vi character varying(20),
    sp_soluong smallint NOT NULL,
    sp_gia numeric(99,2) NOT NULL,
    danhmuc_id bigint NOT NULL,
    CONSTRAINT webapp_sanpham_sp_luotxem_check CHECK ((sp_luotxem >= 0)),
    CONSTRAINT webapp_sanpham_sp_soluong_check CHECK ((sp_soluong >= 0))
);
 "   DROP TABLE public.webapp_sanpham;
       public         heap    postgres    false            �            1259    26002    webapp_sanpham_sp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.webapp_sanpham_sp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.webapp_sanpham_sp_id_seq;
       public          postgres    false    238            �           0    0    webapp_sanpham_sp_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.webapp_sanpham_sp_id_seq OWNED BY public.webapp_sanpham.sp_id;
          public          postgres    false    237            �           2604    25813    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    25822    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    25806    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    213    214    214            �           2604    25829    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    25838    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    25845    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    25941    chat_chatmessage id    DEFAULT     z   ALTER TABLE ONLY public.chat_chatmessage ALTER COLUMN id SET DEFAULT nextval('public.chat_chatmessage_id_seq'::regclass);
 B   ALTER TABLE public.chat_chatmessage ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    25934    chat_thread id    DEFAULT     p   ALTER TABLE ONLY public.chat_thread ALTER COLUMN id SET DEFAULT nextval('public.chat_thread_id_seq'::regclass);
 =   ALTER TABLE public.chat_thread ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    25904    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    25797    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            �           2604    25788    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            �           2604    26033    webapp_ctdh ctdh_id    DEFAULT     z   ALTER TABLE ONLY public.webapp_ctdh ALTER COLUMN ctdh_id SET DEFAULT nextval('public.webapp_ctdh_ctdh_id_seq'::regclass);
 B   ALTER TABLE public.webapp_ctdh ALTER COLUMN ctdh_id DROP DEFAULT;
       public          postgres    false    243    244    244            �           2604    25992    webapp_danhmuc danhmuc_id    DEFAULT     �   ALTER TABLE ONLY public.webapp_danhmuc ALTER COLUMN danhmuc_id SET DEFAULT nextval('public.webapp_danhmuc_danhmuc_id_seq'::regclass);
 H   ALTER TABLE public.webapp_danhmuc ALTER COLUMN danhmuc_id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    26024    webapp_donhang dh_id    DEFAULT     |   ALTER TABLE ONLY public.webapp_donhang ALTER COLUMN dh_id SET DEFAULT nextval('public.webapp_donhang_dh_id_seq'::regclass);
 C   ALTER TABLE public.webapp_donhang ALTER COLUMN dh_id DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    26017    webapp_hinhsp hinhsp_id    DEFAULT     �   ALTER TABLE ONLY public.webapp_hinhsp ALTER COLUMN hinhsp_id SET DEFAULT nextval('public.webapp_hinhsp_hinhsp_id_seq'::regclass);
 F   ALTER TABLE public.webapp_hinhsp ALTER COLUMN hinhsp_id DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    25999    webapp_mgg mgg_id    DEFAULT     v   ALTER TABLE ONLY public.webapp_mgg ALTER COLUMN mgg_id SET DEFAULT nextval('public.webapp_mgg_mgg_id_seq'::regclass);
 @   ALTER TABLE public.webapp_mgg ALTER COLUMN mgg_id DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    26006    webapp_sanpham sp_id    DEFAULT     |   ALTER TABLE ONLY public.webapp_sanpham ALTER COLUMN sp_id SET DEFAULT nextval('public.webapp_sanpham_sp_id_seq'::regclass);
 C   ALTER TABLE public.webapp_sanpham ALTER COLUMN sp_id DROP DEFAULT;
       public          postgres    false    237    238    238            �          0    25810 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   k�       �          0    25819    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   ��       �          0    25803    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214   ��       �          0    25826 	   auth_user 
   TABLE DATA           �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public          postgres    false    220   ��       �          0    25835    auth_user_groups 
   TABLE DATA           A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    222   ��       �          0    25842    auth_user_user_permissions 
   TABLE DATA           P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    224   ��       �          0    25938    chat_chatmessage 
   TABLE DATA           X   COPY public.chat_chatmessage (id, message, "timestamp", thread_id, user_id) FROM stdin;
    public          postgres    false    230   �       �          0    25931    chat_thread 
   TABLE DATA           b   COPY public.chat_thread (id, updated, "timestamp", first_person_id, second_person_id) FROM stdin;
    public          postgres    false    228   ��       �          0    25901    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    226   ��       �          0    25794    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   �       �          0    25785    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   ��       �          0    25972    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    231   ��       �          0    26030    webapp_ctdh 
   TABLE DATA           t   COPY public.webapp_ctdh (ctdh_id, ctdh_tensp, ctdh_vi, ctdh_size, ctdh_soluong, ctdh_gia, dh_id, sp_id) FROM stdin;
    public          postgres    false    244   ��       �          0    25981    webapp_cttk 
   TABLE DATA           z   COPY public.webapp_cttk (tk_id, cttk_hoten, cttk_gioitinh, cttk_ngaysinh, cttk_sdt, cttk_diachi, cttk_avatar) FROM stdin;
    public          postgres    false    232   ��       �          0    25989    webapp_danhmuc 
   TABLE DATA           A   COPY public.webapp_danhmuc (danhmuc_id, danhmuc_ten) FROM stdin;
    public          postgres    false    234   �       �          0    26021    webapp_donhang 
   TABLE DATA           �   COPY public.webapp_donhang (dh_id, dh_thoigian, dh_thanhtoan, dh_trangthai, dh_tienhang, dh_ship, dh_giamgia, dh_tongtien, dh_hoten, dh_sdt, dh_diachi, dh_email, tk_id) FROM stdin;
    public          postgres    false    242   T�       �          0    26014    webapp_hinhsp 
   TABLE DATA           E   COPY public.webapp_hinhsp (hinhsp_id, hinhsp_url, sp_id) FROM stdin;
    public          postgres    false    240   p�       �          0    25996 
   webapp_mgg 
   TABLE DATA           N   COPY public.webapp_mgg (mgg_id, mgg_mgg, mgg_giatri, mgg_thoihan) FROM stdin;
    public          postgres    false    236   \�       �          0    26003    webapp_sanpham 
   TABLE DATA           �   COPY public.webapp_sanpham (sp_id, sp_ten, sp_mota, sp_trangthai, sp_luotxem, sp_ngaytao, sp_size, sp_vi, sp_soluong, sp_gia, danhmuc_id) FROM stdin;
    public          postgres    false    238   y�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    215            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    217            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);
          public          postgres    false    213            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          postgres    false    221            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);
          public          postgres    false    219            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            �           0    0    chat_chatmessage_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.chat_chatmessage_id_seq', 13, true);
          public          postgres    false    229            �           0    0    chat_thread_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.chat_thread_id_seq', 3, true);
          public          postgres    false    227            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          postgres    false    225            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);
          public          postgres    false    211            �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          postgres    false    209            �           0    0    webapp_ctdh_ctdh_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.webapp_ctdh_ctdh_id_seq', 12, true);
          public          postgres    false    243            �           0    0    webapp_danhmuc_danhmuc_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.webapp_danhmuc_danhmuc_id_seq', 7, true);
          public          postgres    false    233            �           0    0    webapp_donhang_dh_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.webapp_donhang_dh_id_seq', 5, true);
          public          postgres    false    241            �           0    0    webapp_hinhsp_hinhsp_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.webapp_hinhsp_hinhsp_id_seq', 23, true);
          public          postgres    false    239            �           0    0    webapp_mgg_mgg_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.webapp_mgg_mgg_id_seq', 1, false);
          public          postgres    false    235            �           0    0    webapp_sanpham_sp_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.webapp_sanpham_sp_id_seq', 21, true);
          public          postgres    false    237            �           2606    25928    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            �           2606    25858 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            �           2606    25824 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            �           2606    25815    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            �           2606    25849 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            �           2606    25808 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214            �           2606    25840 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            postgres    false    222            �           2606    25873 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            postgres    false    222    222            �           2606    25831    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            postgres    false    220            �           2606    25847 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            postgres    false    224            �           2606    25887 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            postgres    false    224    224            �           2606    25923     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            postgres    false    220            �           2606    25945 &   chat_chatmessage chat_chatmessage_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.chat_chatmessage
    ADD CONSTRAINT chat_chatmessage_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.chat_chatmessage DROP CONSTRAINT chat_chatmessage_pkey;
       public            postgres    false    230            �           2606    25947 F   chat_thread chat_thread_first_person_id_second_person_id_11111dfd_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_first_person_id_second_person_id_11111dfd_uniq UNIQUE (first_person_id, second_person_id);
 p   ALTER TABLE ONLY public.chat_thread DROP CONSTRAINT chat_thread_first_person_id_second_person_id_11111dfd_uniq;
       public            postgres    false    228    228            �           2606    25936    chat_thread chat_thread_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.chat_thread DROP CONSTRAINT chat_thread_pkey;
       public            postgres    false    228            �           2606    25909 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    226            �           2606    25801 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            �           2606    25799 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            �           2606    25792 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210                        2606    25978 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    231                       2606    26036    webapp_ctdh webapp_ctdh_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.webapp_ctdh
    ADD CONSTRAINT webapp_ctdh_pkey PRIMARY KEY (ctdh_id);
 F   ALTER TABLE ONLY public.webapp_ctdh DROP CONSTRAINT webapp_ctdh_pkey;
       public            postgres    false    244                       2606    25987    webapp_cttk webapp_cttk_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.webapp_cttk
    ADD CONSTRAINT webapp_cttk_pkey PRIMARY KEY (tk_id);
 F   ALTER TABLE ONLY public.webapp_cttk DROP CONSTRAINT webapp_cttk_pkey;
       public            postgres    false    232                       2606    25994 "   webapp_danhmuc webapp_danhmuc_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.webapp_danhmuc
    ADD CONSTRAINT webapp_danhmuc_pkey PRIMARY KEY (danhmuc_id);
 L   ALTER TABLE ONLY public.webapp_danhmuc DROP CONSTRAINT webapp_danhmuc_pkey;
       public            postgres    false    234                       2606    26028 "   webapp_donhang webapp_donhang_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.webapp_donhang
    ADD CONSTRAINT webapp_donhang_pkey PRIMARY KEY (dh_id);
 L   ALTER TABLE ONLY public.webapp_donhang DROP CONSTRAINT webapp_donhang_pkey;
       public            postgres    false    242                       2606    26019     webapp_hinhsp webapp_hinhsp_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.webapp_hinhsp
    ADD CONSTRAINT webapp_hinhsp_pkey PRIMARY KEY (hinhsp_id);
 J   ALTER TABLE ONLY public.webapp_hinhsp DROP CONSTRAINT webapp_hinhsp_pkey;
       public            postgres    false    240                       2606    26001    webapp_mgg webapp_mgg_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.webapp_mgg
    ADD CONSTRAINT webapp_mgg_pkey PRIMARY KEY (mgg_id);
 D   ALTER TABLE ONLY public.webapp_mgg DROP CONSTRAINT webapp_mgg_pkey;
       public            postgres    false    236            
           2606    26012 "   webapp_sanpham webapp_sanpham_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.webapp_sanpham
    ADD CONSTRAINT webapp_sanpham_pkey PRIMARY KEY (sp_id);
 L   ALTER TABLE ONLY public.webapp_sanpham DROP CONSTRAINT webapp_sanpham_pkey;
       public            postgres    false    238            �           1259    25929    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            �           1259    25869 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            �           1259    25870 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            �           1259    25855 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            �           1259    25885 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            postgres    false    222            �           1259    25884 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            postgres    false    222            �           1259    25899 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            postgres    false    224            �           1259    25898 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            postgres    false    224            �           1259    25924     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            postgres    false    220            �           1259    25970 #   chat_chatmessage_thread_id_0986d8f2    INDEX     e   CREATE INDEX chat_chatmessage_thread_id_0986d8f2 ON public.chat_chatmessage USING btree (thread_id);
 7   DROP INDEX public.chat_chatmessage_thread_id_0986d8f2;
       public            postgres    false    230            �           1259    25971 !   chat_chatmessage_user_id_fa615e65    INDEX     a   CREATE INDEX chat_chatmessage_user_id_fa615e65 ON public.chat_chatmessage USING btree (user_id);
 5   DROP INDEX public.chat_chatmessage_user_id_fa615e65;
       public            postgres    false    230            �           1259    25958 $   chat_thread_first_person_id_b6316931    INDEX     g   CREATE INDEX chat_thread_first_person_id_b6316931 ON public.chat_thread USING btree (first_person_id);
 8   DROP INDEX public.chat_thread_first_person_id_b6316931;
       public            postgres    false    228            �           1259    25959 %   chat_thread_second_person_id_5b8e6677    INDEX     i   CREATE INDEX chat_thread_second_person_id_5b8e6677 ON public.chat_thread USING btree (second_person_id);
 9   DROP INDEX public.chat_thread_second_person_id_5b8e6677;
       public            postgres    false    228            �           1259    25920 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    226            �           1259    25921 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    226            �           1259    25980 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    231                       1259    25979 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    231                       1259    26070    webapp_ctdh_dh_id_8b1f079e    INDEX     S   CREATE INDEX webapp_ctdh_dh_id_8b1f079e ON public.webapp_ctdh USING btree (dh_id);
 .   DROP INDEX public.webapp_ctdh_dh_id_8b1f079e;
       public            postgres    false    244                       1259    26071    webapp_ctdh_sp_id_17ea465c    INDEX     S   CREATE INDEX webapp_ctdh_sp_id_17ea465c ON public.webapp_ctdh USING btree (sp_id);
 .   DROP INDEX public.webapp_ctdh_sp_id_17ea465c;
       public            postgres    false    244                       1259    26059    webapp_donhang_tk_id_f0b550f5    INDEX     Y   CREATE INDEX webapp_donhang_tk_id_f0b550f5 ON public.webapp_donhang USING btree (tk_id);
 1   DROP INDEX public.webapp_donhang_tk_id_f0b550f5;
       public            postgres    false    242                       1259    26053    webapp_hinhsp_sp_id_0dc862bf    INDEX     W   CREATE INDEX webapp_hinhsp_sp_id_0dc862bf ON public.webapp_hinhsp USING btree (sp_id);
 0   DROP INDEX public.webapp_hinhsp_sp_id_0dc862bf;
       public            postgres    false    240                       1259    26047 "   webapp_sanpham_danhmuc_id_6610a1c2    INDEX     c   CREATE INDEX webapp_sanpham_danhmuc_id_6610a1c2 ON public.webapp_sanpham USING btree (danhmuc_id);
 6   DROP INDEX public.webapp_sanpham_danhmuc_id_6610a1c2;
       public            postgres    false    238                       2606    25864 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    214    3283    218                       2606    25859 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    216    218    3288                       2606    25850 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3278    212    214                       2606    25879 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          postgres    false    216    3288    222                       2606    25874 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          postgres    false    220    222    3296                       2606    25893 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          postgres    false    3283    224    214                       2606    25888 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          postgres    false    224    3296    220                        2606    25960 F   chat_chatmessage chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_chatmessage
    ADD CONSTRAINT chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id FOREIGN KEY (thread_id) REFERENCES public.chat_thread(id) DEFERRABLE INITIALLY DEFERRED;
 p   ALTER TABLE ONLY public.chat_chatmessage DROP CONSTRAINT chat_chatmessage_thread_id_0986d8f2_fk_chat_thread_id;
       public          postgres    false    3320    230    228            !           2606    25965 B   chat_chatmessage chat_chatmessage_user_id_fa615e65_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_chatmessage
    ADD CONSTRAINT chat_chatmessage_user_id_fa615e65_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.chat_chatmessage DROP CONSTRAINT chat_chatmessage_user_id_fa615e65_fk_auth_user_id;
       public          postgres    false    230    220    3296                       2606    25948 @   chat_thread chat_thread_first_person_id_b6316931_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_first_person_id_b6316931_fk_auth_user_id FOREIGN KEY (first_person_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.chat_thread DROP CONSTRAINT chat_thread_first_person_id_b6316931_fk_auth_user_id;
       public          postgres    false    228    3296    220                       2606    25953 A   chat_thread chat_thread_second_person_id_5b8e6677_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.chat_thread
    ADD CONSTRAINT chat_thread_second_person_id_5b8e6677_fk_auth_user_id FOREIGN KEY (second_person_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 k   ALTER TABLE ONLY public.chat_thread DROP CONSTRAINT chat_thread_second_person_id_5b8e6677_fk_auth_user_id;
       public          postgres    false    228    220    3296                       2606    25910 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    226    3278    212                       2606    25915 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          postgres    false    220    3296    226            &           2606    26060 >   webapp_ctdh webapp_ctdh_dh_id_8b1f079e_fk_webapp_donhang_dh_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.webapp_ctdh
    ADD CONSTRAINT webapp_ctdh_dh_id_8b1f079e_fk_webapp_donhang_dh_id FOREIGN KEY (dh_id) REFERENCES public.webapp_donhang(dh_id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.webapp_ctdh DROP CONSTRAINT webapp_ctdh_dh_id_8b1f079e_fk_webapp_donhang_dh_id;
       public          postgres    false    244    3343    242            '           2606    26065 >   webapp_ctdh webapp_ctdh_sp_id_17ea465c_fk_webapp_sanpham_sp_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.webapp_ctdh
    ADD CONSTRAINT webapp_ctdh_sp_id_17ea465c_fk_webapp_sanpham_sp_id FOREIGN KEY (sp_id) REFERENCES public.webapp_sanpham(sp_id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.webapp_ctdh DROP CONSTRAINT webapp_ctdh_sp_id_17ea465c_fk_webapp_sanpham_sp_id;
       public          postgres    false    238    244    3338            "           2606    26037 6   webapp_cttk webapp_cttk_tk_id_b8aa3c00_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.webapp_cttk
    ADD CONSTRAINT webapp_cttk_tk_id_b8aa3c00_fk_auth_user_id FOREIGN KEY (tk_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.webapp_cttk DROP CONSTRAINT webapp_cttk_tk_id_b8aa3c00_fk_auth_user_id;
       public          postgres    false    3296    232    220            %           2606    26054 <   webapp_donhang webapp_donhang_tk_id_f0b550f5_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.webapp_donhang
    ADD CONSTRAINT webapp_donhang_tk_id_f0b550f5_fk_auth_user_id FOREIGN KEY (tk_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.webapp_donhang DROP CONSTRAINT webapp_donhang_tk_id_f0b550f5_fk_auth_user_id;
       public          postgres    false    220    242    3296            $           2606    26048 B   webapp_hinhsp webapp_hinhsp_sp_id_0dc862bf_fk_webapp_sanpham_sp_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.webapp_hinhsp
    ADD CONSTRAINT webapp_hinhsp_sp_id_0dc862bf_fk_webapp_sanpham_sp_id FOREIGN KEY (sp_id) REFERENCES public.webapp_sanpham(sp_id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.webapp_hinhsp DROP CONSTRAINT webapp_hinhsp_sp_id_0dc862bf_fk_webapp_sanpham_sp_id;
       public          postgres    false    3338    238    240            #           2606    26042 N   webapp_sanpham webapp_sanpham_danhmuc_id_6610a1c2_fk_webapp_danhmuc_danhmuc_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.webapp_sanpham
    ADD CONSTRAINT webapp_sanpham_danhmuc_id_6610a1c2_fk_webapp_danhmuc_danhmuc_id FOREIGN KEY (danhmuc_id) REFERENCES public.webapp_danhmuc(danhmuc_id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.webapp_sanpham DROP CONSTRAINT webapp_sanpham_danhmuc_id_6610a1c2_fk_webapp_danhmuc_danhmuc_id;
       public          postgres    false    238    234    3333            �      x������ � �      �      x������ � �      �   H  x�]�Y��0E��UxE�!�w�Q�0b��< vZ��W� ���(�ʕ���/U?��:Vq9��.�T�N5���9���[6 �+�-[ ���?����b������׺��d�_���N�7�gXT�]	��{��~6׀ �}�h9�!A;1B:�Ԣ� XP�)�=�]y�C��S��#����p�2��0��2��.G�ת�{����;>ܵ�	&!�?�׉'?���<Ѡk�P��������ɻ0�Y0�v�H�`*��UA$�����nx~i�ko��`2M � *���#���w藩�?Ow��L�oL�D�39V�N�YQ�TI�<��Bi��g��M��M㡭��M�
-I�~���]����~ɥoL�5Ź`�dW��[Z�a6��N�t\��>Ϲ�7ߚ�*��3iUI1�Ҫ PbD�:�K�����r�s�[�ZMqj4�� ǆA�b�anz�{4L.4t���w{��]nR&��IH����Z_%��]�]I�1�c?��O1V�3���2�<�RQ\�Po��՜ޚ~�.���h�w�q>�|D��:�>�S\��|�� ����?�l�7      �   �  x�}��n�0�k�)z�;�`;��D���@F�h�hUiʷC iC �{�=��da���C�ͱe����y���{�c�d�vɎ;2!3�h0���k��͸�G��ͦ�'��%�S�˼���(@��������_���`����#��� P��k������b|�-b7�HU8RU�;P���8�<=�yy�l�i?�-��/����j=]v�#b��"O�d������btw�+1�i��}��*���_�������e�ݿ�'��A��#oxt%�0���>��'�i��C��j�d^�k'�aҏ�$o^mq�gyډ�vU���_<7(5p��F0%|�h�-�OE�F�����B]���u�jE��k�O�:�+� �c�S����&n7��+��ĳ��m?��2[��`���Y�\S]AH��9������'���D��|_zV$I�w�t      �      x������ � �      �      x������ � �      �   h  x�u��N�0�g�)nG���>����%j�h�o����S1E�=�&RK-ۃ�����d���Yª^^F�)� ȅ�
�6f1�`fظ����o�C�9��9�7O�3��c��~U����c��B5<�JN�%�@��y�$�Zt	�ṭ�QSsw�aU3lվ{,�k��E���t*��"z*Sb�.���r?�L6x��Oo�b�x׾��.�	�S�#�x��Ox4]3��[�˶�}x��ؿ�U=���ot],�wOz����:,���Q������H!�f�|=�IM9����P����/I�*�ru^��y!�N�#��z�~���[/����3��;���2��l�$x]�      �   U   x��̱�0D�:��Ų�ve��?)� Q���TѪ�oC�a���jQ¾�`5��h�o�I_>B�{��w`�X��Dt�5$�      �      x������ � �      �   �   x�M�K�0Dמ� RZ>wac�(� N��B�=�*�����c�m���;�yAG<W��r�J���%>�9��`..c�1j]��$W�G*�c���DOw�h���s#�*aqiA�fߨ�&� cZ"�JI0��BTa]�����F�JU�c3l�a�����7^U*      �   �  x����n�0���)��j43l�YV���%� Sc���k���T���?f���sS0S��, ���V������?��ș��~�J�἟٦��i��A�6)R�"���B�Ey3�7����ҧ�/!�����`7F�)��&�2�^ugg�h`�%ۯ��軘�J7jң�$I�-���E)=��l�h�%U��j�j0S��DQC(J���%f�vإ0�1���R�Sґ�qsض#k$L��h��^Bocc�=rY<S�P�(�u�����Ur�i� 
o�ɯ�����tp~ɳ7�;�F�,��e������r�,�0��B�?=���0��|���޻u~#)V�1m��Z�Ȩٻ���Bn��ǘ`XgF�f���^����b�����;����� )Gd��k��12WMP���z��C����Y�������r      �   �  x�]�ɒ�HF�UO���$�w��������������V���	�{�9���b1�%.nYZ!ʑ7Q°5L[Z������~b�]�A�U�,1�/6#�)[վ^�����Rf�\YF��h;����Y`U���܄���>8{���#ݱ���'0���=j�c4���ѭ��TE�$�ƌ&{��*k#��[g��z���6����:�@0A�Q_�a�g~�Շ1@�
�� �ޱ*��^��i5����j~A �03�Ђ��4g ��o ~�ͩ�wl`�P�������8	�Wʂ�U�/�\�B���`�I�C��xG�ɑ��甾����*}V�؟ѱ��!�?�e��>����ꁸ�È������d�ڊv�F�!3���2햸z�7+gf�/'�"�<�E�\�m���_��H����%t�����>K�I��29� 6V8A(h o�d9�c�T���|�?E9�����-��/���/�zg�x����h���0=����\�ڎ�����e�l�t=?/T�����^� ��тCs A�B� 枡�(��y��Us��YTI=����O�v��)1_wV���u�g�����%rȦ�`��;Ȭ��؋���&�,�%'��f�ވ��M}�?`_���<\N���10���5]�S�X{�l�)GEX�^W�_V�J���Y$Z�)�~��[@P�㰥�)R���}��T�#�Qv��4	���r�"3���0�g�����z=�      �     x���1j�@E�S�	�άdɭ�6��e���X�H	�p�#�N�2\��Bd�A^�ؠ���3��̋�-��Q�u��o�����Z���@)�D�i$2L����ʕ*���F������lf4�w���Re�o��^ٟ`�`�;W�̮�ج�y�[Q���
�1����z����Ui`}����x0�����sS�N-~v0�/;�g �t`��Dz��\MRP��b9��#��f�4I��a��K��pw�t���C��#D����p      �   S   x�3��CA\�"���)��y
�
 g	�����������������������]��B2�-T0�L2��*H�2Ű'F��� [Z�      �   C   x�3�t:�0/C!;5�ˈ�9#5�8591;�˘�7���8�˄3$�(17���˜�����Ĕ+F��� /��      �     x���=N1��>�{kf<��@�H�R�Y-�:�ur�@
�B�{�MX�()(������  ���)�dC⠍�ι�B�~4�0����a���m�U�?�F �a�|��۽��o[q��:�4�M[��u�n��4pbH��(:���>ǅ ��~uۮ��Ì�j̬>��(̈́�Ǆ�'2_Dx�#����<!�d9��"�0�xpZs���}��<|���o�b�힋�7��c-�xC �8�aS�Ҭ�Q�r.�ZJ�_��      �   �   x�=P�R�@;w>�"3<�{�b����*����N�Ǥ�t�)��e�0��s�X	�:�*�,
�4	(�KTҫ�B-�y��m��`�Qj4r�{��IѠ���~:��h�\�ag�j��Q@�J|����@�H��m׃)�Rz��mZ��geK����Ǯ{=-�Q����Z-�l$�l�V�۬7���e�{��i���Un`~?F^Lwy��4�S�Ȕd�      �      x������ � �      �   �  x���k�F��ڿb�u�f��V{k�C/-�9�"��Jؒ6��%>SJ	�5���zcBp�81Kd��?�{��4�s��+d�~̼�y�+�,�n1����a����ϓ6qPf�)	�]Ҟ�S����J�NRf�l�Cip�������/>��?��#�<�z1I�e�+����e��'a����)^�pB�7��Ɉl��G��h���_z0��'$��Y<�������댊�0o
�fs>��F�|'o��{|T��#i��Q �����z�26!�,vI�?��o�Y���з|��p�qq���b�2�UD���yu��Ie�N>>z��Sc�2�/S�Z�8;�� �#)|8'C���P��ecwz���`����&�&��p4��"/�Oc3��C�=�P�E��%�};�V������2� 1C�7���cqm�|PM�$Qr��`kk��{�[dV������פI���	�<;O��	���WT	�)�����p3�������������~=v;; ~{������Gh-�m�[��b~�}@���+�6��Iʎw��y�(��8K��aq�H�qI�A��o�	�3��*���y�xJ���O��^���fMR��蜤`�t��tF<C��	
e�6��� :�����-����5��<���ũ�=�{*�E�F��^��8bP��>�lY��/��5�������q9�Pyq������i9�K��6\0�d-<�PA�D��Pv��0=�S��Fߥ��/.�EzL�d:�l�=��%w|��V	D��A�G���n�Đ)�z�6�:�/"8+��%�q<����ziR��ܦH@T{2�h�0��8�u��9A��[{y`��Fv�O10�ELfR��k�������{�� c�J�N$1�HP��+��GM-L��*��r����ɨ�3#O��4g��KtcИ�� >�,݂�c�F���5��c������3X�^i���áu��D�%�U�T�h���P���Ն�:܉��g r�h�z@w]�t!�-˱֪�+���*���9h@0���+,_)vj�~�~�U�[�s�UN��"�ѳ����g�ܔEg��j�i�1ق��:��ʂ���z)�X]w���ܵjyR5�2;�:�r�3���.�B�2&;�H0W���=���^�t���[@A)�m�0MY��\����c/
'S�Z�|��(�{���E���`
���~,��վ�{	&̓�STL!
��iTJ�[�(�_��5O�y�ۘ� ��R��ZI��g��حa��j�oF��]�;�U����]��o�"��ߘ}�'؃;ja rͿx��f��	�TfGQM�%p��b�GT�� ��J�W��N&��=#��v�����h�8q���c1��v���&� ���	�ۖ�g���s�4���WċգnKY|�W�сׁw#�,c�@6[�U�<P8�#�+(z
{�e�L��M�]�ݍ����Ar�N���^��hnW)|LU^�n��]�@vY��7��ɝ�ƽ�/_��J���j������aAʹXبeR�ÚK 35�L��R�9m9S*u%�+q7�t�v�4o%*O��
�P�����L; ; o�=��nq޾��F�������m��     