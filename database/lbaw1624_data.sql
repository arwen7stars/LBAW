--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Data for Name: Anime; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Anime" VALUES (1, 'Accel World', 'https://myanimelist.net/anime/11759/Accel_World');
INSERT INTO "Anime" VALUES (2, 'Ajin', 'https://myanimelist.net/anime/31580/Ajin');
INSERT INTO "Anime" VALUES (3, 'Akame ga Kill!', 'https://myanimelist.net/anime/22199/Akame_ga_Kill');
INSERT INTO "Anime" VALUES (4, 'Akatsuki no Yona', 'https://myanimelist.net/anime/25013/Akatsuki_no_Yona');
INSERT INTO "Anime" VALUES (5, 'Akuma no Riddle', 'https://myanimelist.net/anime/19429/Akuma_no_Riddle');
INSERT INTO "Anime" VALUES (6, 'Aldnoah.Zero', 'https://myanimelist.net/anime/22729/AldnoahZero');
INSERT INTO "Anime" VALUES (7, 'Angel Beats!', 'https://myanimelist.net/anime/6547/Angel_Beats');
INSERT INTO "Anime" VALUES (8, 'Another', 'https://myanimelist.net/anime/11111/Another');
INSERT INTO "Anime" VALUES (9, 'Ansatsu Kyoushitsu (TV)', 'https://myanimelist.net/anime/24833/Ansatsu_Kyoushitsu_TV');
INSERT INTO "Anime" VALUES (10, 'Ao no Kanata no Four Rhythm', 'https://myanimelist.net/anime/28391/Ao_no_Kanata_no_Four_Rhythm');
INSERT INTO "Anime" VALUES (11, 'Aoharu x Kikanjuu', 'https://myanimelist.net/anime/30205/Aoharu_x_Kikanjuu');
INSERT INTO "Anime" VALUES (12, 'Arslan Senki (TV)', 'https://myanimelist.net/anime/28249/Arslan_Senki_TV');
INSERT INTO "Anime" VALUES (13, 'Bakemono no Ko', 'https://myanimelist.net/anime/28805/Bakemono_no_Ko');
INSERT INTO "Anime" VALUES (14, 'Barakamon', 'https://myanimelist.net/anime/22789/Barakamon');
INSERT INTO "Anime" VALUES (15, 'Big Order (TV)', 'https://myanimelist.net/anime/31904/Big_Order_TV');
INSERT INTO "Anime" VALUES (16, 'Black Bullet', 'https://myanimelist.net/anime/20787/Black_Bullet');
INSERT INTO "Anime" VALUES (18, 'Boku dake ga Inai Machi', 'https://myanimelist.net/anime/31043/Boku_dake_ga_Inai_Machi');
INSERT INTO "Anime" VALUES (19, 'Boku no Hero Academia', 'https://myanimelist.net/anime/31964/Boku_no_Hero_Academia');
INSERT INTO "Anime" VALUES (20, 'Btooom!', 'https://myanimelist.net/anime/14345/Btooom');
INSERT INTO "Anime" VALUES (17, 'Black★Rock Shooter (TV)', 'https://myanimelist.net/anime/11285/Black%E2%98%85Rock_Shooter_TV');


--
-- Name: Anime_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Anime_id_seq"', 22, true);


--
-- Data for Name: Character; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Character" VALUES (1, 'Kuroyukihime', 'https://myanimelist.net/character/46305/Kuroyukihime');
INSERT INTO "Character" VALUES (3, 'Kurashima, Chiyuri', 'https://myanimelist.net/character/49635/Chiyuri_Kurashima');
INSERT INTO "Character" VALUES (2, 'Arita, Haruyuki', 'https://myanimelist.net/character/49637/Haruyuki_Arita');
INSERT INTO "Character" VALUES (4, 'Mayuzumi, Takumu', 'https://myanimelist.net/character/49631/Takumu_Mayuzumi');
INSERT INTO "Character" VALUES (5, 'Nagai, Kei', 'https://myanimelist.net/character/88317/Kei_Nagai');
INSERT INTO "Character" VALUES (6, 'Satou', 'https://myanimelist.net/character/108555/Satou');
INSERT INTO "Character" VALUES (7, 'Shimomura, Izumi', 'https://myanimelist.net/character/111801/Izumi_Shimomura');
INSERT INTO "Character" VALUES (8, 'Kaito', 'https://myanimelist.net/character/108553/Kaito');
INSERT INTO "Character" VALUES (9, 'Akame', 'https://myanimelist.net/character/63351/Akame');
INSERT INTO "Character" VALUES (10, 'Mine', 'https://myanimelist.net/character/65229/Mine');
INSERT INTO "Character" VALUES (11, 'Tatsumi', 'https://myanimelist.net/character/64749/Tatsumi');
INSERT INTO "Character" VALUES (12, 'Leone', 'https://myanimelist.net/anime/22199/Akame_ga_Kill');
INSERT INTO "Character" VALUES (13, 'Yona', 'https://myanimelist.net/character/43814/Yona');
INSERT INTO "Character" VALUES (14, 'Son, Hak', 'https://myanimelist.net/character/43815/Hak_Son');
INSERT INTO "Character" VALUES (15, 'Shin-ah', 'https://myanimelist.net/character/67749/Shin-ah');
INSERT INTO "Character" VALUES (16, 'Jae-ha', 'https://myanimelist.net/character/67751/Jae-ha');
INSERT INTO "Character" VALUES (17, 'Azuma, Tokaku', 'https://myanimelist.net/character/86241/Tokaku_Azuma');
INSERT INTO "Character" VALUES (18, 'Ichinose, Haru', 'https://myanimelist.net/character/86239/Haru_Ichinose');
INSERT INTO "Character" VALUES (19, 'Hashiri, Nio', 'https://myanimelist.net/character/96957/Nio_Hashiri');
INSERT INTO "Character" VALUES (20, 'Sagae, Haruki', 'https://myanimelist.net/character/96961/Haruki_Sagae');
INSERT INTO "Character" VALUES (21, 'Kaizuka, Inaho', 'https://myanimelist.net/character/103693/Inaho_Kaizuka');
INSERT INTO "Character" VALUES (22, 'Troyard, Slaine', 'https://myanimelist.net/character/103695/Slaine_Troyard');
INSERT INTO "Character" VALUES (23, 'Vers Allusia, Asseylum', 'https://myanimelist.net/character/103697/Asseylum_Vers_Allusia');
INSERT INTO "Character" VALUES (24, 'Amifumi, Inko', 'https://myanimelist.net/character/107539/Inko_Amifumi');
INSERT INTO "Character" VALUES (25, 'Tachibana, Kanade', 'https://myanimelist.net/character/22369/Kanade_Tachibana');
INSERT INTO "Character" VALUES (26, 'Nakamura, Yuri', 'https://myanimelist.net/character/22370/Yuri_Nakamura');
INSERT INTO "Character" VALUES (27, 'Otonashi, Yuzuru', 'https://myanimelist.net/character/24502/Yuzuru_Otonashi');
INSERT INTO "Character" VALUES (28, 'Hinata, Hideki', 'https://myanimelist.net/character/24503/Hideki_Hinata');
INSERT INTO "Character" VALUES (29, 'Misaki, Mei', 'https://myanimelist.net/character/41402/Mei_Misaki');
INSERT INTO "Character" VALUES (30, 'Sakakibara, Kouichi', 'https://myanimelist.net/character/41400/Kouichi_Sakakibara');
INSERT INTO "Character" VALUES (31, 'Akazawa, Izumi', 'https://myanimelist.net/character/51585/Izumi_Akazawa');
INSERT INTO "Character" VALUES (32, 'Teshigawara, Naoya', 'https://myanimelist.net/character/51587/Naoya_Teshigawara');
INSERT INTO "Character" VALUES (33, 'Koro-sensei', 'https://myanimelist.net/character/65643/Koro-sensei');
INSERT INTO "Character" VALUES (34, 'Akabane, Karma', 'https://myanimelist.net/character/71933/Karma_Akabane');
INSERT INTO "Character" VALUES (35, 'Shiota, Nagisa', 'https://myanimelist.net/character/65645/Nagisa_Shiota');
INSERT INTO "Character" VALUES (36, 'Kayano, Kaede', 'https://myanimelist.net/character/85291/Kaede_Kayano');
INSERT INTO "Character" VALUES (37, 'Kurashina, Asuka', 'https://myanimelist.net/character/118417/Asuka_Kurashina');
INSERT INTO "Character" VALUES (38, 'Tobisawa, Misaki', 'https://myanimelist.net/character/118419/Misaki_Tobisawa');
INSERT INTO "Character" VALUES (39, 'Arisaka, Mashiro', 'https://myanimelist.net/character/118421/Mashiro_Arisaka');
INSERT INTO "Character" VALUES (40, 'Hinata, Masaya', 'https://myanimelist.net/character/118415/Masaya_Hinata');
INSERT INTO "Character" VALUES (41, 'Yukimura, Tooru', 'https://myanimelist.net/character/128109/Tooru_Yukimura');
INSERT INTO "Character" VALUES (42, 'Tachibana, Hotaru', 'https://myanimelist.net/character/128107/Hotaru_Tachibana');
INSERT INTO "Character" VALUES (43, 'Matsuoka, Masamune', 'https://myanimelist.net/character/128108/Masamune_Matsuoka');
INSERT INTO "Character" VALUES (44, 'Midori, Nagamasa', 'https://myanimelist.net/character/128659/Nagamasa_Midori');
INSERT INTO "Character" VALUES (45, 'Daryun', 'https://myanimelist.net/character/14126/Daryun');
INSERT INTO "Character" VALUES (46, 'Arslan', 'https://myanimelist.net/character/11771/Arslan');
INSERT INTO "Character" VALUES (47, 'Narsus', 'https://myanimelist.net/character/14884/Narsus');
INSERT INTO "Character" VALUES (48, 'Gieve', 'https://myanimelist.net/character/17213/Gieve');
INSERT INTO "Character" VALUES (49, 'Kumatetsu', 'https://myanimelist.net/character/120105/Kumatetsu');
INSERT INTO "Character" VALUES (50, 'Ren', 'https://myanimelist.net/character/120103/Ren');
INSERT INTO "Character" VALUES (51, 'Kaede', 'https://myanimelist.net/character/127289/Kaede');
INSERT INTO "Character" VALUES (52, 'Chiko', 'https://myanimelist.net/character/127298/Chiko');
INSERT INTO "Character" VALUES (53, 'Kotoishi, Naru', 'https://myanimelist.net/character/31273/Naru_Kotoishi');
INSERT INTO "Character" VALUES (54, 'Handa, Sei', 'https://myanimelist.net/character/31274/Sei_Handa');
INSERT INTO "Character" VALUES (55, 'Arai, Tamako', 'https://myanimelist.net/character/106355/Tamako_Arai');
INSERT INTO "Character" VALUES (56, 'Kubota, Hina', 'https://myanimelist.net/character/106357/Hina_Kubota');
INSERT INTO "Character" VALUES (57, 'Kurenai, Rin', 'https://myanimelist.net/character/49509/Rin_Kurenai');
INSERT INTO "Character" VALUES (58, 'Hoshimiya, Eiji', 'https://myanimelist.net/character/49505/Eiji_Hoshimiya');
INSERT INTO "Character" VALUES (59, 'Daisy', 'https://myanimelist.net/character/49507/Daisy');
INSERT INTO "Character" VALUES (60, 'Iyo', 'https://myanimelist.net/character/134611/Iyo');
INSERT INTO "Character" VALUES (61, 'Aihara, Enju', 'https://myanimelist.net/character/74621/Enju_Aihara');
INSERT INTO "Character" VALUES (62, 'Satomi, Rentarou', 'https://myanimelist.net/character/74619/Rentarou_Satomi');
INSERT INTO "Character" VALUES (63, 'Sprout, Tina', 'https://myanimelist.net/character/97251/Tina_Sprout');
INSERT INTO "Character" VALUES (64, 'Tendou, Kisara', 'https://myanimelist.net/character/83523/Kisara_Tendou');
INSERT INTO "Character" VALUES (65, 'Black★Rock Shooter', 'https://myanimelist.net/character/19706/Black%E2%98%85Rock_Shooter');
INSERT INTO "Character" VALUES (66, 'Dead Master', 'https://myanimelist.net/character/25034/Dead_Master');
INSERT INTO "Character" VALUES (67, 'Kuroi, Mato', 'https://myanimelist.net/character/63557/Mato_Kuroi');
INSERT INTO "Character" VALUES (68, 'Strength', 'https://myanimelist.net/character/34757/Strength');
INSERT INTO "Character" VALUES (69, 'Fujinuma, Satoru', 'https://myanimelist.net/character/98737/Satoru_Fujinuma');
INSERT INTO "Character" VALUES (70, 'Hinazuki, Kayo', 'https://myanimelist.net/character/126756/Kayo_Hinazuki');
INSERT INTO "Character" VALUES (71, 'Fujinuma, Sachiko', 'https://myanimelist.net/character/130214/Sachiko_Fujinuma');
INSERT INTO "Character" VALUES (72, 'Katagiri, Airi', 'https://myanimelist.net/character/130213/Airi_Katagiri');
INSERT INTO "Character" VALUES (73, 'Midoriya, Izuku', 'https://myanimelist.net/character/117909/Izuku_Midoriya');
INSERT INTO "Character" VALUES (74, 'All Might', 'https://myanimelist.net/character/117921/All_Might');
INSERT INTO "Character" VALUES (75, 'Bakugou, Katsuki', 'https://myanimelist.net/character/117911/Katsuki_Bakugou');
INSERT INTO "Character" VALUES (76, 'Uraraka, Ochako', 'https://myanimelist.net/character/117917/Ochako_Uraraka');
INSERT INTO "Character" VALUES (77, 'Sakamoto, Ryouta', 'https://myanimelist.net/character/49657/Ryouta_Sakamoto');
INSERT INTO "Character" VALUES (78, 'Himiko', 'https://myanimelist.net/character/52941/Himiko');
INSERT INTO "Character" VALUES (79, 'Kira, Kousuke', 'https://myanimelist.net/character/50949/Kousuke_Kira');
INSERT INTO "Character" VALUES (80, 'Taira, Kiyoshi', 'https://myanimelist.net/character/67473/Kiyoshi_Taira');


--
-- Data for Name: Character-Anime; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Character-Anime" VALUES (1, 1);
INSERT INTO "Character-Anime" VALUES (2, 1);
INSERT INTO "Character-Anime" VALUES (3, 1);
INSERT INTO "Character-Anime" VALUES (4, 1);
INSERT INTO "Character-Anime" VALUES (5, 2);
INSERT INTO "Character-Anime" VALUES (6, 2);
INSERT INTO "Character-Anime" VALUES (7, 2);
INSERT INTO "Character-Anime" VALUES (8, 2);
INSERT INTO "Character-Anime" VALUES (9, 3);
INSERT INTO "Character-Anime" VALUES (10, 3);
INSERT INTO "Character-Anime" VALUES (11, 3);
INSERT INTO "Character-Anime" VALUES (12, 3);
INSERT INTO "Character-Anime" VALUES (13, 4);
INSERT INTO "Character-Anime" VALUES (14, 4);
INSERT INTO "Character-Anime" VALUES (15, 4);
INSERT INTO "Character-Anime" VALUES (16, 4);
INSERT INTO "Character-Anime" VALUES (17, 5);
INSERT INTO "Character-Anime" VALUES (18, 5);
INSERT INTO "Character-Anime" VALUES (19, 5);
INSERT INTO "Character-Anime" VALUES (20, 5);
INSERT INTO "Character-Anime" VALUES (21, 6);
INSERT INTO "Character-Anime" VALUES (22, 6);
INSERT INTO "Character-Anime" VALUES (23, 6);
INSERT INTO "Character-Anime" VALUES (24, 6);
INSERT INTO "Character-Anime" VALUES (25, 7);
INSERT INTO "Character-Anime" VALUES (26, 7);
INSERT INTO "Character-Anime" VALUES (27, 7);
INSERT INTO "Character-Anime" VALUES (28, 7);
INSERT INTO "Character-Anime" VALUES (29, 8);
INSERT INTO "Character-Anime" VALUES (30, 8);
INSERT INTO "Character-Anime" VALUES (31, 8);
INSERT INTO "Character-Anime" VALUES (32, 8);
INSERT INTO "Character-Anime" VALUES (33, 9);
INSERT INTO "Character-Anime" VALUES (34, 9);
INSERT INTO "Character-Anime" VALUES (35, 9);
INSERT INTO "Character-Anime" VALUES (36, 9);
INSERT INTO "Character-Anime" VALUES (37, 10);
INSERT INTO "Character-Anime" VALUES (38, 10);
INSERT INTO "Character-Anime" VALUES (39, 10);
INSERT INTO "Character-Anime" VALUES (40, 10);
INSERT INTO "Character-Anime" VALUES (41, 11);
INSERT INTO "Character-Anime" VALUES (42, 11);
INSERT INTO "Character-Anime" VALUES (43, 11);
INSERT INTO "Character-Anime" VALUES (44, 11);
INSERT INTO "Character-Anime" VALUES (45, 12);
INSERT INTO "Character-Anime" VALUES (46, 12);
INSERT INTO "Character-Anime" VALUES (47, 12);
INSERT INTO "Character-Anime" VALUES (48, 12);
INSERT INTO "Character-Anime" VALUES (49, 13);
INSERT INTO "Character-Anime" VALUES (50, 13);
INSERT INTO "Character-Anime" VALUES (51, 13);
INSERT INTO "Character-Anime" VALUES (52, 13);
INSERT INTO "Character-Anime" VALUES (53, 14);
INSERT INTO "Character-Anime" VALUES (54, 14);
INSERT INTO "Character-Anime" VALUES (55, 14);
INSERT INTO "Character-Anime" VALUES (56, 14);
INSERT INTO "Character-Anime" VALUES (57, 15);
INSERT INTO "Character-Anime" VALUES (58, 15);
INSERT INTO "Character-Anime" VALUES (59, 15);
INSERT INTO "Character-Anime" VALUES (60, 15);
INSERT INTO "Character-Anime" VALUES (61, 16);
INSERT INTO "Character-Anime" VALUES (62, 16);
INSERT INTO "Character-Anime" VALUES (63, 16);
INSERT INTO "Character-Anime" VALUES (64, 16);
INSERT INTO "Character-Anime" VALUES (65, 17);
INSERT INTO "Character-Anime" VALUES (66, 17);
INSERT INTO "Character-Anime" VALUES (67, 17);
INSERT INTO "Character-Anime" VALUES (68, 17);
INSERT INTO "Character-Anime" VALUES (69, 18);
INSERT INTO "Character-Anime" VALUES (70, 18);
INSERT INTO "Character-Anime" VALUES (71, 18);
INSERT INTO "Character-Anime" VALUES (72, 18);
INSERT INTO "Character-Anime" VALUES (73, 19);
INSERT INTO "Character-Anime" VALUES (74, 19);
INSERT INTO "Character-Anime" VALUES (75, 19);
INSERT INTO "Character-Anime" VALUES (76, 19);
INSERT INTO "Character-Anime" VALUES (77, 20);
INSERT INTO "Character-Anime" VALUES (78, 20);
INSERT INTO "Character-Anime" VALUES (79, 20);
INSERT INTO "Character-Anime" VALUES (80, 20);


--
-- Data for Name: Location; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Location" VALUES (1, 'Aveiro', 'Portugal');
INSERT INTO "Location" VALUES (2, 'Beja', 'Portugal');
INSERT INTO "Location" VALUES (3, 'Braga', 'Portugal');
INSERT INTO "Location" VALUES (4, 'Bragança', 'Portugal');
INSERT INTO "Location" VALUES (5, 'Castelo Branco', 'Portugal');
INSERT INTO "Location" VALUES (6, 'Coimbra', 'Portugal');
INSERT INTO "Location" VALUES (7, 'Évora', 'Portugal');
INSERT INTO "Location" VALUES (8, 'Faro', 'Portugal');
INSERT INTO "Location" VALUES (9, 'Guarda', 'Portugal');
INSERT INTO "Location" VALUES (10, 'Leiria', 'Portugal');
INSERT INTO "Location" VALUES (11, 'Lisboa', 'Portugal');
INSERT INTO "Location" VALUES (12, 'Portalegre', 'Portugal');
INSERT INTO "Location" VALUES (13, 'Porto', 'Portugal');
INSERT INTO "Location" VALUES (14, 'Santarém', 'Portugal');
INSERT INTO "Location" VALUES (15, 'Setúbal', 'Portugal');
INSERT INTO "Location" VALUES (16, 'Viana do Castelo', 'Portugal');
INSERT INTO "Location" VALUES (17, 'Vila Real', 'Portugal');
INSERT INTO "Location" VALUES (18, 'Viseu', 'Portugal');


--
-- Data for Name: Event; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Event" VALUES (2, 'Dia das Mentiras', '2017-04-01', '2017-04-02', true, 13, NULL);


--
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Group" VALUES (1, 'Public Group', true, NULL);
INSERT INTO "Group" VALUES (2, 'Private Group', false, NULL);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "User" VALUES (1, '1996-05-14', 'Tiago Silva', true, 'Nada a declarar!', 'tirafesi', '123456', 'tirafesi@gmail.com', 1, 13, true);
INSERT INTO "User" VALUES (2, NULL, 'Jon Doe', true, NULL, 'user2', 'ola123456', 'user2@gmail.com', 2, NULL, false);
INSERT INTO "User" VALUES (4, NULL, 'User Four', false, 'This is a private profile!', 'user4', 'ola123456', 'user4@gmail.com', 4, NULL, false);
INSERT INTO "User" VALUES (3, NULL, 'User Three', true, NULL, 'user3', 'ola123456', 'user3@gmail.com', 3, NULL, false);
INSERT INTO "User" VALUES (5, NULL, 'User Five', true, NULL, 'user5', 'ola123456', 'user5@gmail.com', 5, NULL, false);
INSERT INTO "User" VALUES (6, NULL, 'User Six', true, NULL, 'user6', 'ola123456', 'user6@gmail.com', 6, 2, false);
INSERT INTO "User" VALUES (7, '2001-05-10', 'User Seven', true, NULL, 'user7', 'ola123456', 'user7@gmail.com', 7, 11, false);
INSERT INTO "User" VALUES (8, NULL, 'User Eight', true, NULL, 'user8', 'ola123456', 'user8@gmail.com', 8, NULL, false);
INSERT INTO "User" VALUES (9, NULL, 'User Nine', true, 'AYYYYYYY', 'user9', 'ola123456', 'user9@gmail.com', 9, 1, false);
INSERT INTO "User" VALUES (10, NULL, 'User Ten', true, 'I''m USER TEN!!', 'user10', 'ola123456', 'user10@gmail.com', 10, NULL, false);


--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Post" VALUES (1, 'This is my first post! I''m so happy!', false, '2017-03-26', true, 1, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (2, 'Tomorrow is monday! Please kill me now :c', false, '2017-03-26', true, 5, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (3, 'Tomorrow is monday! Please kill me now :c', true, '2017-04-01', true, 1, 5, NULL, NULL);
INSERT INTO "Post" VALUES (4, 'This is our group! Lets have fun :D', false, '2017-03-26', true, 1, NULL, NULL, 1);
INSERT INTO "Post" VALUES (5, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In quis porta lacus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', false, '2014-06-15', true, 2, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In que magnis dis parturient montes, nascetur ridiculus mus.', false, '2010-05-18', true, 2, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (8, 'um ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum maximus ut turpis dictum sollicitudin. Quisque viverra blandit risus varius ornare. Pellentesque vestibulum risus libero, et cursus metus malesuada ac. Nam commodo ex auctor, consequat ex a, luctus lorem. Aenean dolor mi, rutrum eu ultricies ut, mattis eu mauris. Nulla ultrices augue urna, nec bibendum tortor auctor at.', false, '2016-05-29', true, 3, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (9, 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur pulvinar, libero eu auctor facilisis, massa odio condimentum justo, at pretium lectus orci et nibh. Pellentesque consectetur justo est, id hendrerit augue ultrices eget. Aenean eu tortor laoreet, sagittis purus eget, pulvinar tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum maximus ut turpis dictum sollicitudin.', false, '2016-08-02', true, 4, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (10, 'Morbi ut interdum sem. Vivamus tem', false, '2013-05-30', true, 4, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (11, 'Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur vestibulum est quis purus suscipit, a auctor mauris dignissim. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Curabitur pulvinar, libero eu auctor facilisis, massa odio condimentum justo, at pretium lectus orci et nibh.', false, '2013-10-03', true, 7, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (12, 'Nam non ultricies nisl. Etiam et vestibulum ex, nec iaculis ex. Duis ut libero ipsum.', false, '2017-03-25', true, 8, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (13, 'Altricies nisl. Etiam et vestibul.', false, '2017-03-10', false, 8, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (14, 'Nulla facilisi. Pellentesque nulla lacus, tempor et congue a, egestas quis elit. Aenean eu vehicula sem. Quisque eget nisl metus.', false, '2015-05-03', true, 9, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (15, 'Esque nulla lacus, tempor et congue a, egestas quis elietus.', false, '2017-02-10', true, 9, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (16, 'Quisque eu libero non diam posuere ultrices sit amet eu leo. Aenean ac elit eget lectus maximus condimentum nec fringilla magna. Sed id mollis dolor. Nullam finibus, odio ut interdum vehicula, nisl risus luctus nisi, id lobortis tortor risus gravida augue. ', false, '2013-03-29', true, 10, NULL, NULL, NULL);
INSERT INTO "Post" VALUES (32, 'OLa', false, '2017-03-27', true, 1, NULL, NULL, 1);


--
-- Data for Name: Image; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Image" VALUES (1, 'https://myanimelist.cdn-dena.com/images/characters/3/185407.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (2, 'https://myanimelist.cdn-dena.com/images/characters/4/163713.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (3, 'https://myanimelist.cdn-dena.com/images/characters/13/185405.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (4, 'https://myanimelist.cdn-dena.com/images/characters/10/173735.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (5, 'https://myanimelist.cdn-dena.com/images/characters/8/298800.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (6, 'https://myanimelist.cdn-dena.com/images/characters/11/303824.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (7, 'https://myanimelist.cdn-dena.com/images/characters/8/298804.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (8, 'https://myanimelist.cdn-dena.com/images/characters/6/298686.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (9, 'https://myanimelist.cdn-dena.com/images/characters/8/253095.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (10, 'https://myanimelist.cdn-dena.com/images/characters/16/253097.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (11, 'https://myanimelist.cdn-dena.com/images/characters/12/252829.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (12, 'https://myanimelist.cdn-dena.com/images/characters/14/256669.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (13, 'https://myanimelist.cdn-dena.com/images/characters/14/292691.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (14, 'https://myanimelist.cdn-dena.com/images/characters/10/275618.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (15, 'https://myanimelist.cdn-dena.com/images/characters/12/312327.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (16, 'https://myanimelist.cdn-dena.com/images/characters/4/277520.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (17, 'https://myanimelist.cdn-dena.com/images/characters/12/245309.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (18, 'https://myanimelist.cdn-dena.com/images/characters/4/264213.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (19, 'https://myanimelist.cdn-dena.com/images/characters/16/264033.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (20, 'https://myanimelist.cdn-dena.com/images/characters/2/242077.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (21, 'https://myanimelist.cdn-dena.com/images/characters/10/259923.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (22, 'https://myanimelist.cdn-dena.com/images/characters/3/277376.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (23, 'https://myanimelist.cdn-dena.com/images/characters/13/251953.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (24, 'https://myanimelist.cdn-dena.com/images/characters/2/254969.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (25, 'https://myanimelist.cdn-dena.com/images/characters/10/289337.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (26, 'https://myanimelist.cdn-dena.com/images/characters/7/119951.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (27, 'https://myanimelist.cdn-dena.com/images/characters/16/318156.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (28, 'https://myanimelist.cdn-dena.com/images/characters/7/87904.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (29, 'https://myanimelist.cdn-dena.com/images/characters/12/237389.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (30, 'https://myanimelist.cdn-dena.com/images/characters/16/151285.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (31, 'https://myanimelist.cdn-dena.com/images/characters/14/264327.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (32, 'https://myanimelist.cdn-dena.com/images/characters/12/295000.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (33, 'https://myanimelist.cdn-dena.com/images/characters/9/277325.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (34, 'https://myanimelist.cdn-dena.com/images/characters/4/274913.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (35, 'https://myanimelist.cdn-dena.com/images/characters/7/303282.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (36, 'https://myanimelist.cdn-dena.com/images/characters/6/274395.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (37, 'https://myanimelist.cdn-dena.com/images/characters/2/302589.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (38, 'https://myanimelist.cdn-dena.com/images/characters/14/302587.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (39, 'https://myanimelist.cdn-dena.com/images/characters/6/302591.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (40, 'https://myanimelist.cdn-dena.com/images/characters/13/302586.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (41, 'https://myanimelist.cdn-dena.com/images/characters/14/281411.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (42, 'https://myanimelist.cdn-dena.com/images/characters/7/281409.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (43, 'https://myanimelist.cdn-dena.com/images/characters/3/281410.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (44, 'https://myanimelist.cdn-dena.com/images/characters/8/282428.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (45, 'https://myanimelist.cdn-dena.com/images/characters/8/275689.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (46, 'https://myanimelist.cdn-dena.com/images/characters/3/275688.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (47, 'https://myanimelist.cdn-dena.com/images/characters/6/280436.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (48, 'https://myanimelist.cdn-dena.com/images/characters/13/287636.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (49, 'https://myanimelist.cdn-dena.com/images/characters/10/309121.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (50, 'https://myanimelist.cdn-dena.com/images/characters/15/270427.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (51, 'https://myanimelist.cdn-dena.com/images/characters/14/316965.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (52, 'https://myanimelist.cdn-dena.com/images/characters/7/322901.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (53, 'https://myanimelist.cdn-dena.com/images/characters/14/271093.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (54, 'https://myanimelist.cdn-dena.com/images/characters/9/190852.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (55, 'https://myanimelist.cdn-dena.com/images/characters/12/253107.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (56, 'https://myanimelist.cdn-dena.com/images/characters/16/266707.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (57, 'https://myanimelist.cdn-dena.com/images/characters/4/305148.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (58, 'https://myanimelist.cdn-dena.com/images/characters/10/305152.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (59, 'https://myanimelist.cdn-dena.com/images/characters/6/304238.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (60, 'https://myanimelist.cdn-dena.com/images/characters/5/305149.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (61, 'https://myanimelist.cdn-dena.com/images/characters/5/241787.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (62, 'https://myanimelist.cdn-dena.com/images/characters/3/244717.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (63, 'https://myanimelist.cdn-dena.com/images/characters/9/245907.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (64, 'https://myanimelist.cdn-dena.com/images/characters/15/241785.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (65, 'https://myanimelist.cdn-dena.com/images/characters/7/96698.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (66, 'https://myanimelist.cdn-dena.com/images/characters/5/96840.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (67, 'https://myanimelist.cdn-dena.com/images/characters/5/168239.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (68, 'https://myanimelist.cdn-dena.com/images/characters/13/99298.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (69, 'https://myanimelist.cdn-dena.com/images/characters/8/298512.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (70, 'https://myanimelist.cdn-dena.com/images/characters/12/307107.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (71, 'https://myanimelist.cdn-dena.com/images/characters/5/300491.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (72, 'https://myanimelist.cdn-dena.com/images/characters/7/299262.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (73, 'https://myanimelist.cdn-dena.com/images/characters/7/299404.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (74, 'https://myanimelist.cdn-dena.com/images/characters/3/304527.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (75, 'https://myanimelist.cdn-dena.com/images/characters/12/299406.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (76, 'https://myanimelist.cdn-dena.com/images/characters/9/299422.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (77, 'https://myanimelist.cdn-dena.com/images/characters/6/190036.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (78, 'https://myanimelist.cdn-dena.com/images/characters/2/189714.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (79, 'https://myanimelist.cdn-dena.com/images/characters/9/188276.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (80, 'https://myanimelist.cdn-dena.com/images/characters/3/189636.jpg', NULL, NULL, NULL, NULL);
INSERT INTO "Image" VALUES (81, 'http://i.imgur.com/OSntzOM.jpg', 'An image linked to a post', '2017-03-26', 1, NULL);


--
-- Data for Name: Character-Image; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Character-Image" VALUES (1, 1);
INSERT INTO "Character-Image" VALUES (2, 2);
INSERT INTO "Character-Image" VALUES (3, 3);
INSERT INTO "Character-Image" VALUES (4, 4);
INSERT INTO "Character-Image" VALUES (5, 5);
INSERT INTO "Character-Image" VALUES (6, 6);
INSERT INTO "Character-Image" VALUES (7, 7);
INSERT INTO "Character-Image" VALUES (8, 8);
INSERT INTO "Character-Image" VALUES (9, 9);
INSERT INTO "Character-Image" VALUES (10, 10);
INSERT INTO "Character-Image" VALUES (11, 11);
INSERT INTO "Character-Image" VALUES (12, 12);
INSERT INTO "Character-Image" VALUES (13, 13);
INSERT INTO "Character-Image" VALUES (14, 14);
INSERT INTO "Character-Image" VALUES (15, 15);
INSERT INTO "Character-Image" VALUES (16, 16);
INSERT INTO "Character-Image" VALUES (17, 17);
INSERT INTO "Character-Image" VALUES (18, 18);
INSERT INTO "Character-Image" VALUES (19, 19);
INSERT INTO "Character-Image" VALUES (20, 20);
INSERT INTO "Character-Image" VALUES (21, 21);
INSERT INTO "Character-Image" VALUES (22, 22);
INSERT INTO "Character-Image" VALUES (23, 23);
INSERT INTO "Character-Image" VALUES (24, 24);
INSERT INTO "Character-Image" VALUES (25, 25);
INSERT INTO "Character-Image" VALUES (26, 26);
INSERT INTO "Character-Image" VALUES (27, 27);
INSERT INTO "Character-Image" VALUES (28, 28);
INSERT INTO "Character-Image" VALUES (29, 29);
INSERT INTO "Character-Image" VALUES (30, 30);
INSERT INTO "Character-Image" VALUES (31, 31);
INSERT INTO "Character-Image" VALUES (32, 32);
INSERT INTO "Character-Image" VALUES (33, 33);
INSERT INTO "Character-Image" VALUES (34, 34);
INSERT INTO "Character-Image" VALUES (35, 35);
INSERT INTO "Character-Image" VALUES (36, 36);
INSERT INTO "Character-Image" VALUES (37, 37);
INSERT INTO "Character-Image" VALUES (38, 38);
INSERT INTO "Character-Image" VALUES (39, 39);
INSERT INTO "Character-Image" VALUES (40, 40);
INSERT INTO "Character-Image" VALUES (41, 41);
INSERT INTO "Character-Image" VALUES (42, 42);
INSERT INTO "Character-Image" VALUES (43, 43);
INSERT INTO "Character-Image" VALUES (44, 44);
INSERT INTO "Character-Image" VALUES (45, 45);
INSERT INTO "Character-Image" VALUES (46, 46);
INSERT INTO "Character-Image" VALUES (47, 47);
INSERT INTO "Character-Image" VALUES (48, 48);
INSERT INTO "Character-Image" VALUES (49, 49);
INSERT INTO "Character-Image" VALUES (52, 52);
INSERT INTO "Character-Image" VALUES (53, 53);
INSERT INTO "Character-Image" VALUES (54, 54);
INSERT INTO "Character-Image" VALUES (55, 55);
INSERT INTO "Character-Image" VALUES (56, 56);
INSERT INTO "Character-Image" VALUES (57, 57);
INSERT INTO "Character-Image" VALUES (58, 58);
INSERT INTO "Character-Image" VALUES (59, 59);
INSERT INTO "Character-Image" VALUES (60, 60);
INSERT INTO "Character-Image" VALUES (61, 61);
INSERT INTO "Character-Image" VALUES (62, 62);
INSERT INTO "Character-Image" VALUES (63, 63);
INSERT INTO "Character-Image" VALUES (64, 64);
INSERT INTO "Character-Image" VALUES (65, 65);
INSERT INTO "Character-Image" VALUES (66, 66);
INSERT INTO "Character-Image" VALUES (67, 67);
INSERT INTO "Character-Image" VALUES (68, 68);
INSERT INTO "Character-Image" VALUES (69, 69);
INSERT INTO "Character-Image" VALUES (70, 70);
INSERT INTO "Character-Image" VALUES (71, 71);
INSERT INTO "Character-Image" VALUES (72, 72);
INSERT INTO "Character-Image" VALUES (73, 73);
INSERT INTO "Character-Image" VALUES (74, 74);
INSERT INTO "Character-Image" VALUES (75, 75);
INSERT INTO "Character-Image" VALUES (76, 76);
INSERT INTO "Character-Image" VALUES (77, 77);
INSERT INTO "Character-Image" VALUES (78, 78);
INSERT INTO "Character-Image" VALUES (79, 79);
INSERT INTO "Character-Image" VALUES (80, 80);
INSERT INTO "Character-Image" VALUES (50, 50);
INSERT INTO "Character-Image" VALUES (51, 51);


--
-- Name: Character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Character_id_seq"', 80, true);


--
-- Data for Name: Comment; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Comment" VALUES (22, '{Teste}', 1, 1);
INSERT INTO "Comment" VALUES (29, 'Ola', 1, 1);
INSERT INTO "Comment" VALUES (30, 'I love it! I agree!', 5, 1);
INSERT INTO "Comment" VALUES (31, 'asdfghsd', 8, 1);
INSERT INTO "Comment" VALUES (32, 'Ikr! It sucks!', 9, 2);
INSERT INTO "Comment" VALUES (35, 'Ola', 1, 1);
INSERT INTO "Comment" VALUES (38, 'Ola aa', 1, 1);
INSERT INTO "Comment" VALUES (39, 'ahahah', 2, 1);
INSERT INTO "Comment" VALUES (41, 'Facil', 2, 1);
INSERT INTO "Comment" VALUES (43, 'qq', 1, 1);
INSERT INTO "Comment" VALUES (44, 'ola', 1, 2);
INSERT INTO "Comment" VALUES (45, 'ola', 1, 1);


--
-- Name: Comment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Comment_id_seq"', 45, true);


--
-- Data for Name: Event-Invite; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Event-Invite" VALUES (1, 2, 'maybe', 2);
INSERT INTO "Event-Invite" VALUES (1, 3, NULL, 2);


--
-- Name: Event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Event_id_seq"', 2, true);


--
-- Data for Name: Friendship; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Friendship" VALUES (1, 2, true);
INSERT INTO "Friendship" VALUES (1, 3, true);
INSERT INTO "Friendship" VALUES (1, 4, true);
INSERT INTO "Friendship" VALUES (1, 5, true);
INSERT INTO "Friendship" VALUES (1, 6, true);
INSERT INTO "Friendship" VALUES (1, 7, true);
INSERT INTO "Friendship" VALUES (1, 8, true);
INSERT INTO "Friendship" VALUES (1, 9, true);
INSERT INTO "Friendship" VALUES (2, 5, true);
INSERT INTO "Friendship" VALUES (2, 8, true);
INSERT INTO "Friendship" VALUES (6, 10, true);
INSERT INTO "Friendship" VALUES (6, 4, true);
INSERT INTO "Friendship" VALUES (1, 10, true);


--
-- Data for Name: Group-Invite; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Group-Invite" VALUES (2, 8, false, true, 1);
INSERT INTO "Group-Invite" VALUES (2, 7, false, false, 1);
INSERT INTO "Group-Invite" VALUES (1, 10, false, false, 1);


--
-- Name: Group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Group_id_seq"', 2, true);


--
-- Name: Image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Image_id_seq"', 81, true);


--
-- Data for Name: Likes; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Likes" VALUES (9, NULL, 1, 2);
INSERT INTO "Likes" VALUES (5, NULL, 1, 3);
INSERT INTO "Likes" VALUES (2, NULL, 1, 4);
INSERT INTO "Likes" VALUES (3, NULL, 1, 5);
INSERT INTO "Likes" VALUES (4, NULL, 1, 6);
INSERT INTO "Likes" VALUES (6, NULL, 1, 7);
INSERT INTO "Likes" VALUES (7, NULL, 1, 8);
INSERT INTO "Likes" VALUES (8, NULL, 1, 9);
INSERT INTO "Likes" VALUES (10, NULL, 1, 10);
INSERT INTO "Likes" VALUES (3, 38, NULL, 17);
INSERT INTO "Likes" VALUES (7, 31, NULL, 20);
INSERT INTO "Likes" VALUES (1, 22, NULL, 21);


--
-- Name: Likes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Likes_id_seq"', 21, true);


--
-- Name: Location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Location_id_seq"', 18, true);


--
-- Data for Name: News; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--



--
-- Name: News_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"News_id_seq"', 1, false);


--
-- Data for Name: Notification; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Notification" VALUES (71, '2017-03-27', false, 44, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (72, '2017-03-27', false, NULL, 2, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (73, '2017-03-27', false, NULL, 3, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (74, '2017-03-27', false, NULL, 4, 32, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (75, '2017-03-27', false, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 21);
INSERT INTO "Notification" VALUES (76, '2017-03-27', false, 45, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (77, '2017-03-27', false, 45, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (78, '2017-03-27', false, 45, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (79, '2017-03-27', false, NULL, 10, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (80, '2017-03-27', false, NULL, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL);
INSERT INTO "Notification" VALUES (82, '2017-03-27', false, NULL, 1, NULL, 1, 10, NULL, NULL, NULL, NULL, NULL);


--
-- Name: Notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Notification_id_seq"', 82, true);


--
-- Name: Post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Post_id_seq"', 32, true);


--
-- Data for Name: Private-Message; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Private-Message" VALUES (4, 3, 'hey!', '2014-05-17');
INSERT INTO "Private-Message" VALUES (1, 2, 'hello dear friend', '2017-03-26');


--
-- Data for Name: Report; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "Report" VALUES (1, 'Too mainstream!', 1, NULL, 11, 4);


--
-- Name: Report_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"Report_id_seq"', 1, true);


--
-- Data for Name: User-Event; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "User-Event" VALUES (1, 2, true);
INSERT INTO "User-Event" VALUES (5, 2, false);
INSERT INTO "User-Event" VALUES (6, 2, true);


--
-- Data for Name: User-Group; Type: TABLE DATA; Schema: public; Owner: lbaw1624
--

INSERT INTO "User-Group" VALUES (2, 1, true);
INSERT INTO "User-Group" VALUES (1, 1, false);
INSERT INTO "User-Group" VALUES (3, 1, false);
INSERT INTO "User-Group" VALUES (4, 1, false);
INSERT INTO "User-Group" VALUES (1, 2, false);
INSERT INTO "User-Group" VALUES (9, 2, false);
INSERT INTO "User-Group" VALUES (10, 2, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lbaw1624
--

SELECT pg_catalog.setval('"User_id_seq"', 10, true);


--
-- PostgreSQL database dump complete
--

