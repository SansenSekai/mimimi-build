create table users
(
    id       uuid        not null
        constraint users_pkey
            primary key,
    created  timestamp,
    updated  timestamp,
    password varchar(64) not null,
    username varchar(50) not null
        constraint uk_r43af9ap4edm43mmtq01oddj6
            unique
);

alter table users
    owner to admin;

create table subject_categories
(
    id      uuid        not null
        constraint subject_categories_pkey
            primary key,
    created timestamp,
    updated timestamp,
    name    varchar(50) not null
        constraint uk_7mqay55o15bai2qlx83exws04
            unique
);

alter table subject_categories
    owner to admin;

create table subject
(
    id                  uuid         not null
        constraint subject_pkey
            primary key,
    created             timestamp,
    updated             timestamp,
    image_url           varchar(255) not null
        constraint uk_7d9mllqavq4s3dgdw1beo8duq
            unique,
    likes               integer      not null,
    name                varchar(50)  not null,
    subject_category_id uuid         not null
        constraint fkpt76691sgjam5iyyexiwe5dw3
            references subject_categories
);

alter table subject
    owner to admin;

create table user_category
(
    id                  uuid not null
        constraint user_category_pkey
            primary key,
    created             timestamp,
    updated             timestamp,
    subject_category_id uuid not null
        constraint fkqqatrep01fgohylu4xfg7punk
            references subject_categories,
    user_id             uuid not null
        constraint fkh1fip9lpe4alrpurxqfmpftvl
            references users
);

alter table user_category
    owner to admin;


INSERT INTO public.users (id, created, updated, password, username)
    VALUES ('081e3968-786a-4fb9-b5f3-930222ff029b', '2022-09-29 22:33:16.000000', '2022-09-29 22:33:16.000000', '$2a$04$EGgpzdS/3afy8q6cyTPUsO35vwVfyfqmkKhcMIrM5khoaXBAcylwm', 'user');

INSERT INTO public.subject_categories (id, created, updated, name)
    VALUES ('29a2356c-e12a-415b-9f69-ffb02b869435', '2022-09-30 06:12:44.000000', '2022-09-30 06:12:46.000000', 'Кошки'),
            ('5b1de31f-7b9d-48f6-b827-e01e44695260', '2022-09-30 06:12:44.000000', '2022-09-30 06:12:46.000000', 'Собаки'),
            ('5c7da8ba-cde2-471b-a801-915ea9bf5853', '2022-09-30 06:12:44.000000', '2022-09-30 06:12:46.000000', 'Кролики');

INSERT INTO public.user_category (id, created, updated, subject_category_id, user_id)
    VALUES ('7eba01f9-6e04-4f1c-b92e-8a56e19000b4', '2022-09-30 06:22:47.000000', '2022-09-30 06:22:47.000000', '5b1de31f-7b9d-48f6-b827-e01e44695260', '081e3968-786a-4fb9-b5f3-930222ff029b');

INSERT INTO public.subject (id, created, updated, image_url, likes, name, subject_category_id)
    VALUES ('1b8b05de-9fa6-4f1d-bcea-319e9ec6a43d', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://www.eg.ru/wp-content/uploads/2020/09/koshka110456.jpg', 0, 'Кошка 1', '29a2356c-e12a-415b-9f69-ffb02b869435'),
            ('3d09ea44-3b0f-40fc-8018-f72c56db3c84', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://icdn.lenta.ru/images/2022/03/03/09/20220303095556170/square_320_d815f16fa1aad007a5cb7d1ab3611903.jpg', 0, 'Кошка 2', '29a2356c-e12a-415b-9f69-ffb02b869435'),
            ('f67a7d40-7343-4ad4-b8de-ddad96594895', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://cdn.iz.ru/sites/default/files/styles/1920x1080/public/article-2021-04/_AM18250%208.jpg', 0, 'Кошка 3', '29a2356c-e12a-415b-9f69-ffb02b869435'),
            ('56d022da-50a1-439b-92fb-60ad57150563', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://www.bethowen.ru/upload/iblock/63f/63f2f01ca6828d9574995f549d89a2e0.jpeg', 0, 'Кошка 4', '29a2356c-e12a-415b-9f69-ffb02b869435'),
            ('ddabbe8b-ee3d-421f-a8f3-4c03f0803092', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://telegra.ph/file/a23d68b6ee75f6fe6fa67.jpg', 0, 'Кошка 5', '29a2356c-e12a-415b-9f69-ffb02b869435'),
            ('034dc3d4-b8ab-4085-9df6-5ebd3b409c98', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://trikky.ru/wp-content/blogs.dir/1/files/2020/07/18/unnamed-2.jpg', 0, 'Кошка 6', '29a2356c-e12a-415b-9f69-ffb02b869435'),
            ('0d97f5ea-6a28-47fd-ad7c-3e94b38c8ca2', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://goodhands.vet/upload/iblock/48d/48dfdcd8590e901e50e0d986b6953a13.jpg', 0, 'Кошка 7', '29a2356c-e12a-415b-9f69-ffb02b869435');

INSERT INTO public.subject (id, created, updated, image_url, likes, name, subject_category_id)
    VALUES ('820e68d9-a0ba-471e-83cf-6c85cb6bf674', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://n1s2.hsmedia.ru/f7/d1/76/f7d176307bde01e7b11778f8790de38a/480x600_1_f025a54147893d9443128de9f91689d8@1080x1350_0xac120003_8002972281629907126.jpeg', 0, 'Собака 1', '5b1de31f-7b9d-48f6-b827-e01e44695260'),
            ('c32fffa7-6eff-496f-8ffb-72cd1cf1de3e', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://damion.club/uploads/posts/2022-01/1643214353_18-damion-club-p-karmannie-sobachki-belie-pushistie-19.jpg', 0, 'Собака 2', '5b1de31f-7b9d-48f6-b827-e01e44695260'),
            ('91ba7a25-3e1e-4b13-86a2-42145abe6a4d', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://oir.mobi/uploads/posts/2021-05/1620199472_14-oir_mobi-p-samaya-malenkaya-sobachka-poroda-zhivotnie-15.jpg', 0, 'Собака 3', '5b1de31f-7b9d-48f6-b827-e01e44695260'),
            ('3750013a-8531-4432-9720-482859d48439', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://4lapki.com/wp-content/uploads/2017/01/poroda-mal-sob-1.jpg', 0, 'Собака 4', '5b1de31f-7b9d-48f6-b827-e01e44695260'),
            ('3cb19c97-7c7a-404c-92ed-3dad123fec92', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://www.youloveit.ru/uploads/posts/2014-06/1403271568_youloveit_ru_sobachki_i_shenochki_s_cvetami_v_zubah08.jpg', 0, 'Собака 5', '5b1de31f-7b9d-48f6-b827-e01e44695260');

INSERT INTO public.subject (id, created, updated, image_url, likes, name, subject_category_id)
    VALUES ('10322641-c868-4e66-827e-a9a0242f74ae', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'http://continentzoo.ru/loads/images/news/29135575_24956054_1210773225_krolik.jpg', 0, 'Кролик 1', '5c7da8ba-cde2-471b-a801-915ea9bf5853'),
            ('0fe0cec6-2555-4678-aef2-02a685cb188a', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://pitomecdoma.ru/pittoms/karlikovye-kroliki.jpg', 0, 'Кролик 2', '5c7da8ba-cde2-471b-a801-915ea9bf5853'),
            ('8f83e512-247f-4f4e-824a-c1e19e0f447f', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://img-fotki.yandex.ru/get/5501/budda1979.7/0_5531a_7c860ebb_XL.jpg', 0, 'Кролик 3', '5c7da8ba-cde2-471b-a801-915ea9bf5853'),
            ('e1ecb93a-680d-49bb-af6f-c1a6b8661f8f', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://hvost.news/upload/resize_cache/iblock/ba5/750_400_1/korotkosherstnyj_karlikovyj_krolik.jpg', 0, 'Кролик 4', '5c7da8ba-cde2-471b-a801-915ea9bf5853'),
            ('8eb69c06-a026-4e1c-a749-f5869748272d', '2022-09-30 09:09:14.000000', '2022-09-30 09:09:16.000000', 'https://www.meme-arsenal.com/memes/6915d28d110fd4e2b4ad48c2c9fa82b2.jpg', 0, 'Кролик 5', '5c7da8ba-cde2-471b-a801-915ea9bf5853');
