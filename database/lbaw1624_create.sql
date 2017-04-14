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

ALTER TABLE ONLY public."Private-Message" DROP CONSTRAINT "user2-id";
ALTER TABLE ONLY public."Friendship" DROP CONSTRAINT "user2-id";
ALTER TABLE ONLY public."Private-Message" DROP CONSTRAINT "user1-id";
ALTER TABLE ONLY public."Friendship" DROP CONSTRAINT "user1-id";
ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."Event-Invite" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."Likes" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."Image" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."User-Group" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."User-Event" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."Report" DROP CONSTRAINT "user-id";
ALTER TABLE ONLY public."Group-Invite" DROP CONSTRAINT "target-user-id";
ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "post-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "post-id";
ALTER TABLE ONLY public."Likes" DROP CONSTRAINT "post-id";
ALTER TABLE ONLY public."Image" DROP CONSTRAINT "post-id";
ALTER TABLE ONLY public."Report" DROP CONSTRAINT "post-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "pm-user2-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "pm-user1-id";
ALTER TABLE ONLY public."Post" DROP CONSTRAINT "op-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "like-id";
ALTER TABLE ONLY public."Character-Image" DROP CONSTRAINT "image-id";
ALTER TABLE ONLY public."Group-Invite" DROP CONSTRAINT "group-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "group-id";
ALTER TABLE ONLY public."User-Group" DROP CONSTRAINT "group-id";
ALTER TABLE ONLY public."Post" DROP CONSTRAINT "group-id";
ALTER TABLE ONLY public."Group-Invite" DROP CONSTRAINT "group-admin-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "fs-user2-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "fs-user1-id";
ALTER TABLE ONLY public."Event-Invite" DROP CONSTRAINT "event-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "event-id";
ALTER TABLE ONLY public."User-Event" DROP CONSTRAINT "event-id";
ALTER TABLE ONLY public."Post" DROP CONSTRAINT "event-id";
ALTER TABLE ONLY public."Event-Invite" DROP CONSTRAINT "event-admin-id";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "comment-id";
ALTER TABLE ONLY public."Likes" DROP CONSTRAINT "comment-id";
ALTER TABLE ONLY public."Report" DROP CONSTRAINT "comment-id";
ALTER TABLE ONLY public."Character-Image" DROP CONSTRAINT "character-id";
ALTER TABLE ONLY public."Character-Anime" DROP CONSTRAINT "character-id";
ALTER TABLE ONLY public."Character-Anime" DROP CONSTRAINT "anime-id";
ALTER TABLE ONLY public."Report" DROP CONSTRAINT admin;
ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_location-id_fkey";
ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_character-id_fkey";
ALTER TABLE ONLY public."Post" DROP CONSTRAINT "Post_user-id_fkey";
ALTER TABLE ONLY public."Event" DROP CONSTRAINT "Event_location-id_fkey";
DROP TRIGGER update_date ON public."Image";
DROP TRIGGER profile_image_trigger ON public."Image";
DROP TRIGGER post_notification ON public."Post";
DROP TRIGGER pm_trigger ON public."Private-Message";
DROP TRIGGER notification ON public."Group-Invite";
DROP TRIGGER likes_trigger ON public."Likes";
DROP TRIGGER friendship_trigger ON public."Friendship";
DROP TRIGGER event_invite ON public."Event-Invite";
DROP TRIGGER comment_trigger ON public."Comment";
DROP TRIGGER accpeted_trigger ON public."Friendship";
ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_username_key";
ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_email_key";
ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_character-id_key";
ALTER TABLE ONLY public."User-Group" DROP CONSTRAINT "User-Group_pkey";
ALTER TABLE ONLY public."User-Event" DROP CONSTRAINT "User-Event_pkey";
ALTER TABLE ONLY public."Report" DROP CONSTRAINT "Report_pkey";
ALTER TABLE ONLY public."Private-Message" DROP CONSTRAINT "Private-Message_pkey";
ALTER TABLE ONLY public."Post" DROP CONSTRAINT "Post_pkey";
ALTER TABLE ONLY public."Notification" DROP CONSTRAINT "Notification_pkey";
ALTER TABLE ONLY public."News" DROP CONSTRAINT "News_pkey";
ALTER TABLE ONLY public."Location" DROP CONSTRAINT "Location_pkey";
ALTER TABLE ONLY public."Likes" DROP CONSTRAINT "Likes_pkey";
ALTER TABLE ONLY public."Image" DROP CONSTRAINT "Image_pkey";
ALTER TABLE ONLY public."Group" DROP CONSTRAINT "Group_pkey";
ALTER TABLE ONLY public."Group-Invite" DROP CONSTRAINT "Group-Invite_pkey";
ALTER TABLE ONLY public."Friendship" DROP CONSTRAINT "Friendship_pkey";
ALTER TABLE ONLY public."Event" DROP CONSTRAINT "Event_pkey";
ALTER TABLE ONLY public."Event-Invite" DROP CONSTRAINT "Event-Invite_pkey";
ALTER TABLE ONLY public."Comment" DROP CONSTRAINT "Comment_pkey";
ALTER TABLE ONLY public."Character" DROP CONSTRAINT "Character_url_key";
ALTER TABLE ONLY public."Character" DROP CONSTRAINT "Character_pkey";
ALTER TABLE ONLY public."Character" DROP CONSTRAINT "Character_name_key";
ALTER TABLE ONLY public."Character-Image" DROP CONSTRAINT "Character-Image_pkey";
ALTER TABLE ONLY public."Character-Anime" DROP CONSTRAINT "Character-Anime_pkey";
ALTER TABLE ONLY public."Anime" DROP CONSTRAINT "Anime_url_key";
ALTER TABLE ONLY public."Anime" DROP CONSTRAINT "Anime_pkey";
ALTER TABLE ONLY public."Anime" DROP CONSTRAINT "Anime_name_key";
ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Report" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Post" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Notification" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."News" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Location" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Likes" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Image" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Group" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Event" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Comment" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Character" ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public."Anime" ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public."User_id_seq";
DROP TABLE public."User-Group";
DROP TABLE public."User-Event";
DROP TABLE public."User";
DROP SEQUENCE public."Report_id_seq";
DROP TABLE public."Report";
DROP TABLE public."Private-Message";
DROP SEQUENCE public."Post_id_seq";
DROP TABLE public."Post";
DROP SEQUENCE public."Notification_id_seq";
DROP TABLE public."Notification";
DROP SEQUENCE public."News_id_seq";
DROP TABLE public."News";
DROP SEQUENCE public."Location_id_seq";
DROP TABLE public."Location";
DROP SEQUENCE public."Likes_id_seq";
DROP TABLE public."Likes";
DROP SEQUENCE public."Image_id_seq";
DROP TABLE public."Image";
DROP SEQUENCE public."Group_id_seq";
DROP TABLE public."Group-Invite";
DROP TABLE public."Group";
DROP TABLE public."Friendship";
DROP SEQUENCE public."Event_id_seq";
DROP TABLE public."Event-Invite";
DROP TABLE public."Event";
DROP SEQUENCE public."Comment_id_seq";
DROP TABLE public."Comment";
DROP SEQUENCE public."Character_id_seq";
DROP TABLE public."Character-Image";
DROP TABLE public."Character-Anime";
DROP TABLE public."Character";
DROP SEQUENCE public."Anime_id_seq";
DROP TABLE public."Anime";
DROP FUNCTION public.update_image_date();
DROP FUNCTION public.profile_image();
DROP FUNCTION public.post_notification();
DROP FUNCTION public."pm-notification"();
DROP FUNCTION public.likes_notification();
DROP FUNCTION public.group_invite_notification();
DROP FUNCTION public.friendship_notification();
DROP FUNCTION public.event_invite_notification();
DROP FUNCTION public.comment_notification();
DROP FUNCTION public.accepted_friend_notification();
DROP TYPE public.type;
DROP TYPE public.option;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: lbaw1624
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO lbaw1624;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: lbaw1624
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: option; Type: TYPE; Schema: public; Owner: lbaw1624
--

CREATE TYPE option AS ENUM (
    'going',
    'maybe',
    'ignore'
);


ALTER TYPE option OWNER TO lbaw1624;

--
-- Name: type; Type: TYPE; Schema: public; Owner: lbaw1624
--

CREATE TYPE type AS ENUM (
    'going',
    'maybe',
    'ignore'
);


ALTER TYPE type OWNER TO lbaw1624;

--
-- Name: accepted_friend_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION accepted_friend_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
IF new."accepted"=true THEN
INSERT INTO "Notification"("user-id","friendship-user1-id","friendship-user2-id")
VALUES(new."user1-id",new."user1-id",new."user2-id");
RETURN new;
END IF;
END;$$;


ALTER FUNCTION public.accepted_friend_notification() OWNER TO lbaw1624;

--
-- Name: comment_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION comment_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE t_row "Comment"%rowtype;
BEGIN
FOR t_row in SELECT * FROM "Comment" WHERE "post-id"=new."post-id" LOOP
IF new."user-id"!=t_row."user-id" THEN
IF NOT EXISTS (SELECT * FROM "Notification" WHERE "comment-id" = new."id" AND "user-id" = t_row."user-id") THEN
INSERT INTO "Notification"("comment-id","user-id")
VALUES(new."id", t_row."user-id");
END IF;
END IF;
END LOOP;
RETURN new;
END;
$$;


ALTER FUNCTION public.comment_notification() OWNER TO lbaw1624;

--
-- Name: event_invite_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION event_invite_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO "Notification" ("event-id","user-id") VALUES(new."event-id",new."user-id");
RETURN new;
END;$$;


ALTER FUNCTION public.event_invite_notification() OWNER TO lbaw1624;

--
-- Name: friendship_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION friendship_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO "Notification" ("user-id","friendship-user1-id", "friendship-user2-id")
VALUES(new."user2-id",new."user1-id",new."user2-id");
RETURN new;
END;$$;


ALTER FUNCTION public.friendship_notification() OWNER TO lbaw1624;

--
-- Name: group_invite_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION group_invite_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO "Notification" ("group-id","user-id") VALUES(new."group-id",new."user-id");
RETURN new;
END;$$;


ALTER FUNCTION public.group_invite_notification() OWNER TO lbaw1624;

--
-- Name: likes_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION likes_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE "op-id" integer;
DECLARE "comment-id" integer;
DECLARE "post" integer;
BEGIN
IF new."post-id" IS NOT NULL THEN
"op-id":= (SELECT "op-id" FROM "Post" WHERE "id"=new."post-id"); 
INSERT INTO "Notification"("user-id","like-id")
VALUES("op-id",new."id");
RETURN NEW;
END IF;
IF new."comment-id" IS NOT NULL THEN
"comment-id":= (SELECT "user-id" FROM "Comment" WHERE "id"=new."comment-id");
"post":= (SELECT "post-id" FROM "Comment" WHERE "id"=new."comment-id");
INSERT INTO "Notification"("user-id","like-id")
VALUES("comment-id",new."id");
RETURN new;
END IF;
END;$$;


ALTER FUNCTION public.likes_notification() OWNER TO lbaw1624;

--
-- Name: pm-notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION "pm-notification"() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
INSERT INTO "Notification" ("user-id","pm-user1-id", "pm-user2-id")
VALUES(new."user2-id",new."user1-id",new."user2-id");
RETURN new;
END;
$$;


ALTER FUNCTION public."pm-notification"() OWNER TO lbaw1624;

--
-- Name: post_notification(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION post_notification() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE 
rowUser "User-Group"%rowtype;
rowEvent "User-Event"%rowtype;


BEGIN
	IF NEW."group-id" IS NOT NULL THEN
		FOR rowUser in SELECT * FROM "User-Group" WHERE "group-id"=NEW."group-id" LOOP
			IF NEW."user-id" != rowUser."user-id" THEN
			INSERT INTO "Notification" ("user-id","post-id") VALUES (rowUser."user-id", new."id");
			END IF;
		END LOOP;
	END IF; 
	IF NEW."event-id" IS NOT NULL THEN
	FOR rowEvent in SELECT * FROM "User-Event" WHERE "event-id"=NEW."event-id" LOOP
		IF NEW."user-id" != rowEvent."user-id" THEN
		INSERT INTO "Notification" ("user-id","post-id") VALUES (rowEvent ."user-id", new."id");
		END IF;
	END LOOP;
	END IF;
	RETURN NEW;
END;$$;


ALTER FUNCTION public.post_notification() OWNER TO lbaw1624;

--
-- Name: profile_image(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION profile_image() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE privacy boolean;
BEGIN
IF new."post-id"= NULL THEN
privacy:= (SELECT "public" FROM User WHERE id=new."user-id");
INSERT INTO "Post"("user-id","public")
VALUES(new."user-id",privacy);
END IF;
END;$$;


ALTER FUNCTION public.profile_image() OWNER TO lbaw1624;

--
-- Name: update_image_date(); Type: FUNCTION; Schema: public; Owner: lbaw1624
--

CREATE FUNCTION update_image_date() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
NEW.date = now();
RETURN NEW;
END;$$;


ALTER FUNCTION public.update_image_date() OWNER TO lbaw1624;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Anime; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Anime" (
    id integer NOT NULL,
    name character varying(256) NOT NULL,
    url character varying(256) NOT NULL
);


ALTER TABLE "Anime" OWNER TO lbaw1624;

--
-- Name: Anime_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Anime_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Anime_id_seq" OWNER TO lbaw1624;

--
-- Name: Anime_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Anime_id_seq" OWNED BY "Anime".id;


--
-- Name: Character; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Character" (
    id integer NOT NULL,
    name text NOT NULL,
    url text NOT NULL
);


ALTER TABLE "Character" OWNER TO lbaw1624;

--
-- Name: Character-Anime; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Character-Anime" (
    "character-id" integer NOT NULL,
    "anime-id" integer NOT NULL
);


ALTER TABLE "Character-Anime" OWNER TO lbaw1624;

--
-- Name: Character-Image; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Character-Image" (
    "character-id" integer NOT NULL,
    "image-id" integer NOT NULL
);


ALTER TABLE "Character-Image" OWNER TO lbaw1624;

--
-- Name: Character_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Character_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Character_id_seq" OWNER TO lbaw1624;

--
-- Name: Character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Character_id_seq" OWNED BY "Character".id;


--
-- Name: Comment; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Comment" (
    id integer NOT NULL,
    body text,
    "user-id" integer NOT NULL,
    "post-id" integer NOT NULL
);


ALTER TABLE "Comment" OWNER TO lbaw1624;

--
-- Name: Comment_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Comment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Comment_id_seq" OWNER TO lbaw1624;

--
-- Name: Comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Comment_id_seq" OWNED BY "Comment".id;


--
-- Name: Event; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Event" (
    id integer NOT NULL,
    name text NOT NULL,
    start date NOT NULL,
    finish date NOT NULL,
    public boolean NOT NULL,
    "location-id" integer NOT NULL,
    about text,
    CONSTRAINT date CHECK ((start <= finish))
);


ALTER TABLE "Event" OWNER TO lbaw1624;

--
-- Name: Event-Invite; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Event-Invite" (
    "event-admin-id" integer NOT NULL,
    "user-id" integer NOT NULL,
    type option,
    "event-id" integer NOT NULL,
    CONSTRAINT "event-ad-user-diff" CHECK (("event-admin-id" <> "user-id"))
);


ALTER TABLE "Event-Invite" OWNER TO lbaw1624;

--
-- Name: Event_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Event_id_seq" OWNER TO lbaw1624;

--
-- Name: Event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Event_id_seq" OWNED BY "Event".id;


--
-- Name: Friendship; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Friendship" (
    "user1-id" integer NOT NULL,
    "user2-id" integer NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    CONSTRAINT "different-users" CHECK (("user1-id" <> "user2-id"))
);


ALTER TABLE "Friendship" OWNER TO lbaw1624;

--
-- Name: Group; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Group" (
    id integer NOT NULL,
    name text NOT NULL,
    public boolean NOT NULL,
    about text
);


ALTER TABLE "Group" OWNER TO lbaw1624;

--
-- Name: Group-Invite; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Group-Invite" (
    "group-admin-id" integer NOT NULL,
    "user-id" integer NOT NULL,
    accepted boolean DEFAULT false NOT NULL,
    ignored boolean DEFAULT false NOT NULL,
    "group-id" integer NOT NULL,
    CONSTRAINT "group-user-different" CHECK (("group-admin-id" <> "user-id"))
);


ALTER TABLE "Group-Invite" OWNER TO lbaw1624;

--
-- Name: Group_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Group_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Group_id_seq" OWNER TO lbaw1624;

--
-- Name: Group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Group_id_seq" OWNED BY "Group".id;


--
-- Name: Image; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Image" (
    id integer NOT NULL,
    url text NOT NULL,
    description text,
    date date DEFAULT now(),
    "post-id" integer,
    "user-id" integer
);


ALTER TABLE "Image" OWNER TO lbaw1624;

--
-- Name: Image_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Image_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Image_id_seq" OWNER TO lbaw1624;

--
-- Name: Image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Image_id_seq" OWNED BY "Image".id;


--
-- Name: Likes; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Likes" (
    "user-id" integer NOT NULL,
    "comment-id" integer,
    "post-id" integer,
    id integer NOT NULL,
    CONSTRAINT likescheck CHECK (
CASE
    WHEN ("post-id" IS NOT NULL) THEN ("comment-id" IS NULL)
    WHEN ("comment-id" IS NOT NULL) THEN ("post-id" IS NULL)
    ELSE NULL::boolean
END)
);


ALTER TABLE "Likes" OWNER TO lbaw1624;

--
-- Name: Likes_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Likes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Likes_id_seq" OWNER TO lbaw1624;

--
-- Name: Likes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Likes_id_seq" OWNED BY "Likes".id;


--
-- Name: Location; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Location" (
    id integer NOT NULL,
    city text,
    country text
);


ALTER TABLE "Location" OWNER TO lbaw1624;

--
-- Name: Location_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Location_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Location_id_seq" OWNER TO lbaw1624;

--
-- Name: Location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Location_id_seq" OWNED BY "Location".id;


--
-- Name: News; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "News" (
    id integer NOT NULL,
    title text NOT NULL,
    body text,
    date date DEFAULT now() NOT NULL
);


ALTER TABLE "News" OWNER TO lbaw1624;

--
-- Name: News_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "News_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "News_id_seq" OWNER TO lbaw1624;

--
-- Name: News_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "News_id_seq" OWNED BY "News".id;


--
-- Name: Notification; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Notification" (
    id integer NOT NULL,
    date date DEFAULT now() NOT NULL,
    seen boolean DEFAULT false NOT NULL,
    "comment-id" integer,
    "user-id" integer NOT NULL,
    "post-id" integer,
    "friendship-user1-id" integer,
    "friendship-user2-id" integer,
    "event-id" integer,
    "group-id" integer,
    "pm-user1-id" integer,
    "pm-user2-id" integer,
    "like-id" integer,
    CONSTRAINT notificationcheck CHECK (
CASE
    WHEN (("friendship-user1-id" IS NOT NULL) AND ("friendship-user2-id" IS NOT NULL)) THEN ((((((("comment-id" IS NULL) AND ("post-id" IS NULL)) AND ("group-id" IS NULL)) AND ("event-id" IS NULL)) AND ("pm-user1-id" IS NULL)) AND ("pm-user2-id" IS NULL)) AND ("like-id" IS NULL))
    WHEN (("pm-user1-id" IS NOT NULL) AND ("pm-user2-id" IS NOT NULL)) THEN ((((((("comment-id" IS NULL) AND ("post-id" IS NULL)) AND ("group-id" IS NULL)) AND ("event-id" IS NULL)) AND ("friendship-user1-id" IS NULL)) AND ("friendship-user2-id" IS NULL)) AND ("like-id" IS NULL))
    WHEN ("post-id" IS NOT NULL) THEN (((((((("group-id" IS NULL) AND ("event-id" IS NULL)) AND ("friendship-user1-id" IS NULL)) AND ("friendship-user2-id" IS NULL)) AND ("comment-id" IS NULL)) AND ("pm-user1-id" IS NULL)) AND ("pm-user2-id" IS NULL)) AND ("like-id" IS NULL))
    WHEN ("comment-id" IS NOT NULL) THEN (((((((("post-id" IS NULL) AND ("group-id" IS NULL)) AND ("event-id" IS NULL)) AND ("friendship-user1-id" IS NULL)) AND ("friendship-user2-id" IS NULL)) AND ("pm-user1-id" IS NULL)) AND ("pm-user2-id" IS NULL)) AND ("like-id" IS NULL))
    WHEN ("like-id" IS NOT NULL) THEN (((((((("post-id" IS NULL) AND ("group-id" IS NULL)) AND ("event-id" IS NULL)) AND ("friendship-user1-id" IS NULL)) AND ("friendship-user2-id" IS NULL)) AND ("pm-user1-id" IS NULL)) AND ("pm-user2-id" IS NULL)) AND ("comment-id" IS NULL))
    WHEN ("group-id" IS NOT NULL) THEN (((((((("post-id" IS NULL) AND ("comment-id" IS NULL)) AND ("event-id" IS NULL)) AND ("friendship-user1-id" IS NULL)) AND ("friendship-user2-id" IS NULL)) AND ("pm-user1-id" IS NULL)) AND ("pm-user2-id" IS NULL)) AND ("like-id" IS NULL))
    WHEN ("event-id" IS NOT NULL) THEN (((((((("post-id" IS NULL) AND ("group-id" IS NULL)) AND ("comment-id" IS NULL)) AND ("friendship-user1-id" IS NULL)) AND ("friendship-user2-id" IS NULL)) AND ("pm-user1-id" IS NULL)) AND ("pm-user2-id" IS NULL)) AND ("like-id" IS NULL))
    ELSE NULL::boolean
END)
);


ALTER TABLE "Notification" OWNER TO lbaw1624;

--
-- Name: Notification_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Notification_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Notification_id_seq" OWNER TO lbaw1624;

--
-- Name: Notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Notification_id_seq" OWNED BY "Notification".id;


--
-- Name: Post; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Post" (
    id integer NOT NULL,
    body text,
    shared boolean DEFAULT false NOT NULL,
    date date DEFAULT now(),
    public boolean NOT NULL,
    "user-id" integer NOT NULL,
    "op-id" integer,
    "event-id" integer,
    "group-id" integer,
    CONSTRAINT "post-check" CHECK (
CASE
    WHEN ("group-id" IS NOT NULL) THEN ("event-id" IS NULL)
    WHEN ("event-id" IS NOT NULL) THEN ("group-id" IS NULL)
    ELSE NULL::boolean
END),
    CONSTRAINT sharedcheck CHECK (
CASE
    WHEN (shared = true) THEN ("op-id" IS NOT NULL)
    WHEN ("op-id" IS NOT NULL) THEN (shared = true)
    ELSE NULL::boolean
END)
);


ALTER TABLE "Post" OWNER TO lbaw1624;

--
-- Name: Post_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Post_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Post_id_seq" OWNER TO lbaw1624;

--
-- Name: Post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Post_id_seq" OWNED BY "Post".id;


--
-- Name: Private-Message; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Private-Message" (
    "user1-id" integer NOT NULL,
    "user2-id" integer NOT NULL,
    body text,
    date date DEFAULT now() NOT NULL,
    CONSTRAINT "diff-users" CHECK (("user1-id" <> "user2-id"))
);


ALTER TABLE "Private-Message" OWNER TO lbaw1624;

--
-- Name: Report; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "Report" (
    id integer NOT NULL,
    body text,
    admin integer NOT NULL,
    "comment-id" integer,
    "post-id" integer,
    "user-id" integer,
    CONSTRAINT reportcheck CHECK (
CASE
    WHEN ("comment-id" IS NULL) THEN ("post-id" IS NOT NULL)
    WHEN ("comment-id" IS NOT NULL) THEN ("post-id" IS NULL)
    ELSE NULL::boolean
END)
);


ALTER TABLE "Report" OWNER TO lbaw1624;

--
-- Name: Report_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "Report_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Report_id_seq" OWNER TO lbaw1624;

--
-- Name: Report_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "Report_id_seq" OWNED BY "Report".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "User" (
    id integer NOT NULL,
    "date-of-birth" date,
    name text NOT NULL,
    public boolean NOT NULL,
    about text,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL,
    "character-id" integer NOT NULL,
    "location-id" integer,
    admin boolean NOT NULL
);


ALTER TABLE "User" OWNER TO lbaw1624;

--
-- Name: User-Event; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "User-Event" (
    "user-id" integer NOT NULL,
    "event-id" integer NOT NULL,
    admin boolean NOT NULL
);


ALTER TABLE "User-Event" OWNER TO lbaw1624;

--
-- Name: User-Group; Type: TABLE; Schema: public; Owner: lbaw1624; Tablespace: 
--

CREATE TABLE "User-Group" (
    "user-id" integer NOT NULL,
    "group-id" integer NOT NULL,
    admin boolean NOT NULL
);


ALTER TABLE "User-Group" OWNER TO lbaw1624;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: lbaw1624
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "User_id_seq" OWNER TO lbaw1624;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lbaw1624
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Anime" ALTER COLUMN id SET DEFAULT nextval('"Anime_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Character" ALTER COLUMN id SET DEFAULT nextval('"Character_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Comment" ALTER COLUMN id SET DEFAULT nextval('"Comment_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Event" ALTER COLUMN id SET DEFAULT nextval('"Event_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Group" ALTER COLUMN id SET DEFAULT nextval('"Group_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Image" ALTER COLUMN id SET DEFAULT nextval('"Image_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Likes" ALTER COLUMN id SET DEFAULT nextval('"Likes_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Location" ALTER COLUMN id SET DEFAULT nextval('"Location_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "News" ALTER COLUMN id SET DEFAULT nextval('"News_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification" ALTER COLUMN id SET DEFAULT nextval('"Notification_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Post" ALTER COLUMN id SET DEFAULT nextval('"Post_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Report" ALTER COLUMN id SET DEFAULT nextval('"Report_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Name: Anime_name_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Anime"
    ADD CONSTRAINT "Anime_name_key" UNIQUE (name);


--
-- Name: Anime_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Anime"
    ADD CONSTRAINT "Anime_pkey" PRIMARY KEY (id);


--
-- Name: Anime_url_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Anime"
    ADD CONSTRAINT "Anime_url_key" UNIQUE (url);


--
-- Name: Character-Anime_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Character-Anime"
    ADD CONSTRAINT "Character-Anime_pkey" PRIMARY KEY ("anime-id", "character-id");


--
-- Name: Character-Image_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Character-Image"
    ADD CONSTRAINT "Character-Image_pkey" PRIMARY KEY ("character-id", "image-id");


--
-- Name: Character_name_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Character"
    ADD CONSTRAINT "Character_name_key" UNIQUE (name);


--
-- Name: Character_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Character"
    ADD CONSTRAINT "Character_pkey" PRIMARY KEY (id);


--
-- Name: Character_url_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Character"
    ADD CONSTRAINT "Character_url_key" UNIQUE (url);


--
-- Name: Comment_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);


--
-- Name: Event-Invite_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Event-Invite"
    ADD CONSTRAINT "Event-Invite_pkey" PRIMARY KEY ("event-admin-id", "user-id");


--
-- Name: Event_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Event"
    ADD CONSTRAINT "Event_pkey" PRIMARY KEY (id);


--
-- Name: Friendship_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Friendship"
    ADD CONSTRAINT "Friendship_pkey" PRIMARY KEY ("user1-id", "user2-id");


--
-- Name: Group-Invite_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Group-Invite"
    ADD CONSTRAINT "Group-Invite_pkey" PRIMARY KEY ("group-admin-id", "user-id");


--
-- Name: Group_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY (id);


--
-- Name: Image_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Image"
    ADD CONSTRAINT "Image_pkey" PRIMARY KEY (id);


--
-- Name: Likes_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Likes"
    ADD CONSTRAINT "Likes_pkey" PRIMARY KEY (id);


--
-- Name: Location_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Location"
    ADD CONSTRAINT "Location_pkey" PRIMARY KEY (id);


--
-- Name: News_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "News"
    ADD CONSTRAINT "News_pkey" PRIMARY KEY (id);


--
-- Name: Notification_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "Notification_pkey" PRIMARY KEY (id);


--
-- Name: Post_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);


--
-- Name: Private-Message_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Private-Message"
    ADD CONSTRAINT "Private-Message_pkey" PRIMARY KEY ("user1-id", "user2-id");


--
-- Name: Report_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "Report"
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (id);


--
-- Name: User-Event_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "User-Event"
    ADD CONSTRAINT "User-Event_pkey" PRIMARY KEY ("user-id", "event-id");


--
-- Name: User-Group_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "User-Group"
    ADD CONSTRAINT "User-Group_pkey" PRIMARY KEY ("user-id", "group-id");


--
-- Name: User_character-id_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_character-id_key" UNIQUE ("character-id");


--
-- Name: User_email_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- Name: User_pkey; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: User_username_key; Type: CONSTRAINT; Schema: public; Owner: lbaw1624; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);


--
-- Name: accpeted_trigger; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER accpeted_trigger AFTER UPDATE ON "Friendship" FOR EACH ROW EXECUTE PROCEDURE accepted_friend_notification();


--
-- Name: comment_trigger; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER comment_trigger AFTER INSERT ON "Comment" FOR EACH ROW EXECUTE PROCEDURE comment_notification();


--
-- Name: event_invite; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER event_invite AFTER INSERT ON "Event-Invite" FOR EACH ROW EXECUTE PROCEDURE event_invite_notification();


--
-- Name: friendship_trigger; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER friendship_trigger AFTER INSERT ON "Friendship" FOR EACH ROW EXECUTE PROCEDURE friendship_notification();


--
-- Name: likes_trigger; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER likes_trigger AFTER INSERT ON "Likes" FOR EACH ROW EXECUTE PROCEDURE likes_notification();


--
-- Name: notification; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER notification AFTER INSERT ON "Group-Invite" FOR EACH ROW EXECUTE PROCEDURE group_invite_notification();


--
-- Name: pm_trigger; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER pm_trigger AFTER INSERT ON "Private-Message" FOR EACH ROW EXECUTE PROCEDURE "pm-notification"();


--
-- Name: post_notification; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER post_notification AFTER INSERT ON "Post" FOR EACH ROW EXECUTE PROCEDURE post_notification();


--
-- Name: profile_image_trigger; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER profile_image_trigger AFTER INSERT ON "Image" FOR EACH ROW EXECUTE PROCEDURE profile_image();


--
-- Name: update_date; Type: TRIGGER; Schema: public; Owner: lbaw1624
--

CREATE TRIGGER update_date AFTER INSERT ON "Image" FOR EACH ROW EXECUTE PROCEDURE update_image_date();

ALTER TABLE "Image" DISABLE TRIGGER update_date;


--
-- Name: Event_location-id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Event"
    ADD CONSTRAINT "Event_location-id_fkey" FOREIGN KEY ("location-id") REFERENCES "Location"(id);


--
-- Name: Post_user-id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Post"
    ADD CONSTRAINT "Post_user-id_fkey" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: User_character-id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_character-id_fkey" FOREIGN KEY ("character-id") REFERENCES "Character"(id);


--
-- Name: User_location-id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_location-id_fkey" FOREIGN KEY ("location-id") REFERENCES "Location"(id);


--
-- Name: admin; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Report"
    ADD CONSTRAINT admin FOREIGN KEY (admin) REFERENCES "User"(id);


--
-- Name: anime-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Character-Anime"
    ADD CONSTRAINT "anime-id" FOREIGN KEY ("anime-id") REFERENCES "Anime"(id);


--
-- Name: character-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Character-Anime"
    ADD CONSTRAINT "character-id" FOREIGN KEY ("character-id") REFERENCES "Character"(id);


--
-- Name: character-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Character-Image"
    ADD CONSTRAINT "character-id" FOREIGN KEY ("character-id") REFERENCES "Character"(id);


--
-- Name: comment-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Report"
    ADD CONSTRAINT "comment-id" FOREIGN KEY ("comment-id") REFERENCES "Comment"(id);


--
-- Name: comment-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Likes"
    ADD CONSTRAINT "comment-id" FOREIGN KEY ("comment-id") REFERENCES "Comment"(id);


--
-- Name: comment-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "comment-id" FOREIGN KEY ("comment-id") REFERENCES "Comment"(id);


--
-- Name: event-admin-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Event-Invite"
    ADD CONSTRAINT "event-admin-id" FOREIGN KEY ("event-admin-id") REFERENCES "User"(id);


--
-- Name: event-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Post"
    ADD CONSTRAINT "event-id" FOREIGN KEY ("event-id") REFERENCES "Event"(id);


--
-- Name: event-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User-Event"
    ADD CONSTRAINT "event-id" FOREIGN KEY ("event-id") REFERENCES "Event"(id);


--
-- Name: event-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "event-id" FOREIGN KEY ("event-id") REFERENCES "Event"(id);


--
-- Name: event-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Event-Invite"
    ADD CONSTRAINT "event-id" FOREIGN KEY ("event-id") REFERENCES "Event"(id);


--
-- Name: fs-user1-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "fs-user1-id" FOREIGN KEY ("friendship-user1-id") REFERENCES "User"(id);


--
-- Name: fs-user2-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "fs-user2-id" FOREIGN KEY ("friendship-user2-id") REFERENCES "User"(id);


--
-- Name: group-admin-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Group-Invite"
    ADD CONSTRAINT "group-admin-id" FOREIGN KEY ("group-admin-id") REFERENCES "User"(id);


--
-- Name: group-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Post"
    ADD CONSTRAINT "group-id" FOREIGN KEY ("group-id") REFERENCES "Group"(id);


--
-- Name: group-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User-Group"
    ADD CONSTRAINT "group-id" FOREIGN KEY ("group-id") REFERENCES "Group"(id);


--
-- Name: group-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "group-id" FOREIGN KEY ("group-id") REFERENCES "Group"(id);


--
-- Name: group-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Group-Invite"
    ADD CONSTRAINT "group-id" FOREIGN KEY ("group-id") REFERENCES "Group"(id);


--
-- Name: image-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Character-Image"
    ADD CONSTRAINT "image-id" FOREIGN KEY ("image-id") REFERENCES "Image"(id);


--
-- Name: like-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "like-id" FOREIGN KEY ("like-id") REFERENCES "Likes"(id);


--
-- Name: op-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Post"
    ADD CONSTRAINT "op-id" FOREIGN KEY ("op-id") REFERENCES "User"(id);


--
-- Name: pm-user1-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "pm-user1-id" FOREIGN KEY ("pm-user1-id") REFERENCES "User"(id);


--
-- Name: pm-user2-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "pm-user2-id" FOREIGN KEY ("pm-user2-id") REFERENCES "User"(id);


--
-- Name: post-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Report"
    ADD CONSTRAINT "post-id" FOREIGN KEY ("post-id") REFERENCES "Post"(id);


--
-- Name: post-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Image"
    ADD CONSTRAINT "post-id" FOREIGN KEY ("post-id") REFERENCES "Post"(id);


--
-- Name: post-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Likes"
    ADD CONSTRAINT "post-id" FOREIGN KEY ("post-id") REFERENCES "Post"(id);


--
-- Name: post-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "post-id" FOREIGN KEY ("post-id") REFERENCES "Post"(id);


--
-- Name: post-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Comment"
    ADD CONSTRAINT "post-id" FOREIGN KEY ("post-id") REFERENCES "Post"(id);


--
-- Name: target-user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Group-Invite"
    ADD CONSTRAINT "target-user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Report"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User-Event"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "User-Group"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Image"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Likes"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Notification"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Event-Invite"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Comment"
    ADD CONSTRAINT "user-id" FOREIGN KEY ("user-id") REFERENCES "User"(id);


--
-- Name: user1-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Friendship"
    ADD CONSTRAINT "user1-id" FOREIGN KEY ("user1-id") REFERENCES "User"(id);


--
-- Name: user1-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Private-Message"
    ADD CONSTRAINT "user1-id" FOREIGN KEY ("user1-id") REFERENCES "User"(id);


--
-- Name: user2-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Friendship"
    ADD CONSTRAINT "user2-id" FOREIGN KEY ("user2-id") REFERENCES "User"(id);


--
-- Name: user2-id; Type: FK CONSTRAINT; Schema: public; Owner: lbaw1624
--

ALTER TABLE ONLY "Private-Message"
    ADD CONSTRAINT "user2-id" FOREIGN KEY ("user2-id") REFERENCES "User"(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: lbaw1624
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM lbaw1624;
GRANT ALL ON SCHEMA public TO lbaw1624;


--
-- PostgreSQL database dump complete
--

