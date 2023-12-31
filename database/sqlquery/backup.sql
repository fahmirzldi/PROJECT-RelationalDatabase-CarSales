PGDMP         $                {            PACMANN - CAR SALES PROJECT    15.2    15.2 -    ,           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            -           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            .           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            /           1262    25242    PACMANN - CAR SALES PROJECT    DATABASE     �   CREATE DATABASE "PACMANN - CAR SALES PROJECT" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 -   DROP DATABASE "PACMANN - CAR SALES PROJECT";
                postgres    false            �            1259    25379 
   bid_status    TABLE     5  CREATE TABLE public.bid_status (
    bid_id integer NOT NULL,
    product_id integer NOT NULL,
    buyer_id integer NOT NULL,
    date_bid date NOT NULL,
    bid_price numeric NOT NULL,
    bid_status character varying NOT NULL,
    CONSTRAINT bid_status_bid_price_check CHECK ((bid_price > (0)::numeric))
);
    DROP TABLE public.bid_status;
       public         heap    postgres    false            �            1259    25378    bid_status_bid_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bid_status_bid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.bid_status_bid_id_seq;
       public          postgres    false    217            0           0    0    bid_status_bid_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.bid_status_bid_id_seq OWNED BY public.bid_status.bid_id;
          public          postgres    false    216            �            1259    25409    buyer    TABLE     �   CREATE TABLE public.buyer (
    buyer_id integer NOT NULL,
    buyer_name character varying NOT NULL,
    city_id integer NOT NULL
);
    DROP TABLE public.buyer;
       public         heap    postgres    false            �            1259    25408    buyer_buyer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.buyer_buyer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.buyer_buyer_id_seq;
       public          postgres    false    223            1           0    0    buyer_buyer_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.buyer_buyer_id_seq OWNED BY public.buyer.buyer_id;
          public          postgres    false    222            �            1259    25368    car_specification    TABLE     N  CREATE TABLE public.car_specification (
    product_id integer NOT NULL,
    seller_id integer NOT NULL,
    brand character varying NOT NULL,
    model character varying NOT NULL,
    body_type character varying NOT NULL,
    year integer NOT NULL,
    price numeric NOT NULL,
    bid_allow character varying NOT NULL,
    date_post date NOT NULL,
    CONSTRAINT car_specification_bid_allow_check CHECK (((bid_allow)::text = ANY ((ARRAY['Allow'::character varying, 'Not Allow'::character varying])::text[]))),
    CONSTRAINT car_specification_price_check CHECK ((price > (0)::numeric))
);
 %   DROP TABLE public.car_specification;
       public         heap    postgres    false            �            1259    25367     car_specification_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.car_specification_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.car_specification_product_id_seq;
       public          postgres    false    215            2           0    0     car_specification_product_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.car_specification_product_id_seq OWNED BY public.car_specification.product_id;
          public          postgres    false    214            �            1259    25398    city    TABLE     �   CREATE TABLE public.city (
    city_id integer NOT NULL,
    city_name character varying NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    25397    city_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.city_city_id_seq;
       public          postgres    false    221            3           0    0    city_city_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.city_city_id_seq OWNED BY public.city.city_id;
          public          postgres    false    220            �            1259    25389    seller    TABLE     �   CREATE TABLE public.seller (
    seller_id integer NOT NULL,
    seller_name character varying NOT NULL,
    city_id integer NOT NULL
);
    DROP TABLE public.seller;
       public         heap    postgres    false            �            1259    25388    seller_seller_id_seq    SEQUENCE     �   CREATE SEQUENCE public.seller_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.seller_seller_id_seq;
       public          postgres    false    219            4           0    0    seller_seller_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.seller_seller_id_seq OWNED BY public.seller.seller_id;
          public          postgres    false    218            z           2604    25382    bid_status bid_id    DEFAULT     v   ALTER TABLE ONLY public.bid_status ALTER COLUMN bid_id SET DEFAULT nextval('public.bid_status_bid_id_seq'::regclass);
 @   ALTER TABLE public.bid_status ALTER COLUMN bid_id DROP DEFAULT;
       public          postgres    false    216    217    217            }           2604    25412    buyer buyer_id    DEFAULT     p   ALTER TABLE ONLY public.buyer ALTER COLUMN buyer_id SET DEFAULT nextval('public.buyer_buyer_id_seq'::regclass);
 =   ALTER TABLE public.buyer ALTER COLUMN buyer_id DROP DEFAULT;
       public          postgres    false    222    223    223            y           2604    25371    car_specification product_id    DEFAULT     �   ALTER TABLE ONLY public.car_specification ALTER COLUMN product_id SET DEFAULT nextval('public.car_specification_product_id_seq'::regclass);
 K   ALTER TABLE public.car_specification ALTER COLUMN product_id DROP DEFAULT;
       public          postgres    false    214    215    215            |           2604    25401    city city_id    DEFAULT     l   ALTER TABLE ONLY public.city ALTER COLUMN city_id SET DEFAULT nextval('public.city_city_id_seq'::regclass);
 ;   ALTER TABLE public.city ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    220    221    221            {           2604    25392    seller seller_id    DEFAULT     t   ALTER TABLE ONLY public.seller ALTER COLUMN seller_id SET DEFAULT nextval('public.seller_seller_id_seq'::regclass);
 ?   ALTER TABLE public.seller ALTER COLUMN seller_id DROP DEFAULT;
       public          postgres    false    218    219    219            #          0    25379 
   bid_status 
   TABLE DATA           c   COPY public.bid_status (bid_id, product_id, buyer_id, date_bid, bid_price, bid_status) FROM stdin;
    public          postgres    false    217   �5       )          0    25409    buyer 
   TABLE DATA           >   COPY public.buyer (buyer_id, buyer_name, city_id) FROM stdin;
    public          postgres    false    223   8       !          0    25368    car_specification 
   TABLE DATA           ~   COPY public.car_specification (product_id, seller_id, brand, model, body_type, year, price, bid_allow, date_post) FROM stdin;
    public          postgres    false    215   ";       '          0    25398    city 
   TABLE DATA           G   COPY public.city (city_id, city_name, latitude, longitude) FROM stdin;
    public          postgres    false    221   G>       %          0    25389    seller 
   TABLE DATA           A   COPY public.seller (seller_id, seller_name, city_id) FROM stdin;
    public          postgres    false    219   �?       5           0    0    bid_status_bid_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.bid_status_bid_id_seq', 1, false);
          public          postgres    false    216            6           0    0    buyer_buyer_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.buyer_buyer_id_seq', 1, false);
          public          postgres    false    222            7           0    0     car_specification_product_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.car_specification_product_id_seq', 1, false);
          public          postgres    false    214            8           0    0    city_city_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.city_city_id_seq', 1, false);
          public          postgres    false    220            9           0    0    seller_seller_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.seller_seller_id_seq', 1, false);
          public          postgres    false    218            �           2606    25387    bid_status bid_status_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bid_status
    ADD CONSTRAINT bid_status_pkey PRIMARY KEY (bid_id);
 D   ALTER TABLE ONLY public.bid_status DROP CONSTRAINT bid_status_pkey;
       public            postgres    false    217            �           2606    25416    buyer buyer_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT buyer_pkey PRIMARY KEY (buyer_id);
 :   ALTER TABLE ONLY public.buyer DROP CONSTRAINT buyer_pkey;
       public            postgres    false    223            �           2606    25377 (   car_specification car_specification_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.car_specification
    ADD CONSTRAINT car_specification_pkey PRIMARY KEY (product_id);
 R   ALTER TABLE ONLY public.car_specification DROP CONSTRAINT car_specification_pkey;
       public            postgres    false    215            �           2606    25407    city city_city_name_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_city_name_key UNIQUE (city_name);
 A   ALTER TABLE ONLY public.city DROP CONSTRAINT city_city_name_key;
       public            postgres    false    221            �           2606    25405    city city_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (city_id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    221            �           2606    25396    seller seller_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (seller_id);
 <   ALTER TABLE ONLY public.seller DROP CONSTRAINT seller_pkey;
       public            postgres    false    219            �           2606    25428    bid_status rel_bidstatus_buyer    FK CONSTRAINT     �   ALTER TABLE ONLY public.bid_status
    ADD CONSTRAINT rel_bidstatus_buyer FOREIGN KEY (buyer_id) REFERENCES public.buyer(buyer_id);
 H   ALTER TABLE ONLY public.bid_status DROP CONSTRAINT rel_bidstatus_buyer;
       public          postgres    false    223    217    3212            �           2606    25423 )   bid_status rel_bidstatus_carspecification    FK CONSTRAINT     �   ALTER TABLE ONLY public.bid_status
    ADD CONSTRAINT rel_bidstatus_carspecification FOREIGN KEY (product_id) REFERENCES public.car_specification(product_id);
 S   ALTER TABLE ONLY public.bid_status DROP CONSTRAINT rel_bidstatus_carspecification;
       public          postgres    false    215    3202    217            �           2606    25438    buyer rel_buyer_city    FK CONSTRAINT     w   ALTER TABLE ONLY public.buyer
    ADD CONSTRAINT rel_buyer_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);
 >   ALTER TABLE ONLY public.buyer DROP CONSTRAINT rel_buyer_city;
       public          postgres    false    223    3210    221            �           2606    25418 -   car_specification rel_carspecification_seller    FK CONSTRAINT     �   ALTER TABLE ONLY public.car_specification
    ADD CONSTRAINT rel_carspecification_seller FOREIGN KEY (seller_id) REFERENCES public.seller(seller_id);
 W   ALTER TABLE ONLY public.car_specification DROP CONSTRAINT rel_carspecification_seller;
       public          postgres    false    3206    219    215            �           2606    25433    seller rel_seller_city    FK CONSTRAINT     y   ALTER TABLE ONLY public.seller
    ADD CONSTRAINT rel_seller_city FOREIGN KEY (city_id) REFERENCES public.city(city_id);
 @   ALTER TABLE ONLY public.seller DROP CONSTRAINT rel_seller_city;
       public          postgres    false    221    219    3210            #   .  x�eT9V1���2�x�rZZZ*���3K���,Kfb�JRD�R6��k�����}		_ ;����	�č, r�~�AJ�����B'����ɌԖ
���G%�$� ��KB4�Nꗎv �ֳ�~�qr0`4���Băղ��dr��!�ho����a	�V�
�ې�8��	���N�ҝ��rā�gm��a�,[ �zO�JVi����ˑѐ�G��zkψ���7Y|�:�nn!���ٵ�'�ek}����;��� ĳ�ЀupV"�5C�W���
�b�50��w��c�;&��&i���,Λl�"h�G	�
o||vSgm�n��#l)O����́��N�,�u���=!]s�THg��E���8>VL��>0֯k`���~I<rd+X��12�FE����WO�k���n���&�A�g������X�>:��	�F� <���mAqKZ�z̼��Ю~����xb�3���Ă��vb�7}?�AQ"Pwd�p�6|O����9	������d���!�Z�h�yb��t qC��~}�^�?v�H�      )     x�U��n�8��GO�(�H�,�2����vP$؛�J��)�x��3��НHΜ3�#3xFOF�@?���̪,�a��A��Yt�:�e�L4�Z�
#�[�L��V�RucڞPm�]p�/j����%Ru�'�u���C��A�YU&Y�9�GiW�� ���f0�@��;T{rH#T�w	�S�����[+%���O{���fr&%��EQ�Iv�$K+���m�&
�2�R��u�d9�{��؞%й�ӰY��M-նhC�֎_�6=�ӹY�Sk/�>�KY�귩z��~[��;�P$�6�m�zyG��nV�!����c�dK�����sݔ[��='e�=����x�(=��'d��A
�X'�d���]P=��p}�.�|.���mhX��8�\Ã�C'�#�S�!/�O���ر�������};�����-88!��J���OE���"���}�/�|	/�u4Jd���C�`L�7ߵ����
#��,�`ž/C���Ȏ��AX6������q������r��ဆ�J�E���m��l���I��������(l}���G&�ol�Hؙ��>X���#z	�;~��5V�?�9}�rl�=�h����6-��
��a�SLT��#�L޻h���2�"�ۖ���LM��(4���$T�|K�E��#������_E	7��!~�P�1���^���OT&�&b��|m�Q���~���%�������t�������Z}�\�	ZL���������Ŷ��I���,x       !     x��V�NA|�~E~વw�n�1��P�JU����r'""Ah_߹���['�D�9{<������z�o�?���N��������rK��h�Z������6�F�I"�p!K#�8��[Q��F���]B,�a�5�L �zB,��@!6��3���s�������A𔺒K+&��w�@C����dIIr�D�og�R���!!4"���~��+`|�o��[�V��.��l=^c�F�#��0�ߓ?C�ɠE��?z`��GÁB%�1��6����n��������Bt
J׈7��8pY�U�;�����J�Z���D.����d���G��LwF OV`ί��#�}��<���6��)$�1~I����y⨞ZS�Z3��I���B����������/�灊h`7�5�����ӧ������mLt�$�"d.�|`s���75&vr NYb�=�F˪ `MYM�AK�"v ���t"�qY�����~z]|�_^�E�f�-�M�`=��dk�!0��>�����2��r�C��M��'����Ks�_�^3ή�Gr�B�Q��R6Ix��jǓA�,��y�S��*��<�[��Z]���`7@k k~'t�=\�[�J�L�Vg�%g���>o8$�j\�j5�%�F��.t����~?�i����a.R�vt%u*{P�o�������nؾ-><l���A��E;��x@��`t�>9Uk<>=�ӢU��8Qy:-��M#���R8�k��,��?�c��E�      '   `  x�U��j�@��)�:���f���%PH{X؋��`����y�Jv�/!�˯4&(н~O��u�Ϸ��S�"��*$��rj
>�IG]0B&^p)0;�g�1�&�Di���t�y�Iǔ�d�q�������_��%g��ƕ[ ����I�C�Rb�P[� 0

'rUW��G��Wu�����
ej5P������NwYZA��I�}������� ��ͥ%Y� t�|��R0�更(��,Nn���~���p����V,^�yT��?���{[���fm7Xj%r{�Н~��{�XN�L�����(��C_.j�f���1�b��>�/���ᬋ�QX�GsD��Z�C?�@��      %   �  x�]T�r�@<��b? �B/GlC�	_r,��v�v��O�$l'�jfw�{�g��;{P��߸�(H/�L�jZ�Q�+q�/j����ъm!�ZY�T#.z1=�)��NvB���n�pa���P��#oH���W��3Q+͆M�]�&�jf����#Z�j[���rq�Mm(� wL�LX]�C�p������3c��Rp%=��V���Z������B��+u��ʩ�D���*׍�Z�F^�G����Ckۨ��*j�emD��+#��CZ�}�����m\�6��=F��/��Wi0
�Kƺ쁏��t��g��vg��~O`L)^�1cs+@�p@k���]��6m�ɩOt����H�����n{�����L4�b.W�aD�#�����ZW{Q�~5�i�A�3w
�y�$0\B+kΎ�3qpb/��v*�1��DJ?lWG�����zk>��+��Z ;�rb��p)��р&%�b�=p���Ԋ��,��!�ZK��"���t�1��o�\�N�S�T�b,��W��K~VK��V��5;I�����W.�����'���2Vw��f�N>;2�=���!��c������}h���n`�j����o������#&{���C�-�Y���t�{��P*��~�V�e\�%���4���	�v�y�I�ۥ6�bۇ��شj�#�&�-�g�����w�-�[ԓ�_�d@[6���T���^�_��y�lQ     