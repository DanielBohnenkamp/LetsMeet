-- public.user definition

-- Drop table

-- DROP TABLE public.user;

CREATE TABLE public.user (
	id int4 NOT NULL,
    email varchar NOT NULL,
	first_name varchar NULL,
	last_name varchar NULL,
	phone_number varchar NULL,
	gender varchar NULL,
	interested_in varchar NULL,
	age int4 NULL,
	acc_creation_date timestamp NOT NULL,
	acc_last_update timestamp NULL,
	photo bytea NULL,
	street varchar NULL,
	zip varchar NULL,
	city varchar NULL,
	CONSTRAINT user_age_check CHECK ((age >= 18)),
	CONSTRAINT user_pkey PRIMARY KEY (id)
);


-- public.hobby definition

-- Drop table

-- DROP TABLE public.hobby;

CREATE TABLE public.hobby (
	id serial4 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT hobby_pkey PRIMARY KEY (id)
);


-- public.additional_recources definition

-- Drop table

-- DROP TABLE public.additional_recources;

CREATE TABLE public.additional_recources (
	id serial4 NOT NULL,
	user_id int4 NULL,
	"content" bytea NULL,
	path_external varchar NULL,
	upload_date timestamp NULL,
	CONSTRAINT additional_recources_pkey PRIMARY KEY (id),
	CONSTRAINT additional_recources_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(id)
);


-- public.friendship definition

-- Drop table

-- DROP TABLE public.friendship;

CREATE TABLE public.friendship (
	user_id int4 NOT NULL,
	friend_user_id int4 NOT NULL,
	CONSTRAINT unique_friendship PRIMARY KEY (user_id, friend_user_id),
	CONSTRAINT friendship_friend_user_id_fkey FOREIGN KEY (friend_user_id) REFERENCES public.user(id),
	CONSTRAINT friendship_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(id)
);


-- public.message definition

-- Drop table

-- DROP TABLE public.message;

CREATE TABLE public.message (
	id serial4 NOT NULL,
	conversation_id int4 NOT NULL,
	sender_user_id int4 NOT NULL,
	receiver_user_id int4 NOT NULL,
	message_body varchar NULL,
	message_date timestamp NULL,
	CONSTRAINT message_pkey PRIMARY KEY (id),
	CONSTRAINT message_receiver_user_id_fkey FOREIGN KEY (receiver_user_id) REFERENCES public.user(id),
	CONSTRAINT message_sender_user_id_fkey FOREIGN KEY (sender_user_id) REFERENCES public.user(id)
);


-- public.profile_like definition

-- Drop table

-- DROP TABLE public.profile_like;

CREATE TABLE public.profile_like (
	id serial4 NOT NULL,
	user_id int4 NOT NULL,
	liked_user_id int4 NOT NULL,
	status varchar NULL,
	like_date timestamp NULL,
	CONSTRAINT profile_like_pkey PRIMARY KEY (id),
	CONSTRAINT profile_like_liked_user_id_fkey FOREIGN KEY (liked_user_id) REFERENCES public.user(id),
	CONSTRAINT profile_like_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(id)
);


-- public.user_hobby definition

-- Drop table

-- DROP TABLE public.user_hobby;

CREATE TABLE public.user_hobby (
    id serial4 NOT NULL,
	user_id int4 NOT NULL,
	hobby_id int4 NOT NULL,
	prio float4 NULL,
	CONSTRAINT user_hobby_pkey PRIMARY KEY (id),
	CONSTRAINT user_hobby_prio_check CHECK (((prio >= ('-1.0'::numeric)::double precision) OR (prio <= (1.0)::double precision))),
	CONSTRAINT user_hobby_hobby_id_fkey FOREIGN KEY (hobby_id) REFERENCES public.hobby(id),
	CONSTRAINT user_hobby_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user(id)
);