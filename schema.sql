CREATE TABLE checkpoint (
    checkpoint_id integer NOT NULL,
    checkpoint_who character varying,
    checkpoint_what character varying,
    checkpoint_expected_duration interval,
    start_time time without time zone,
    flexible_start_time boolean DEFAULT true NOT NULL,
    important boolean DEFAULT false NOT NULL,
    checklist character varying,
    checkpoint_additional_text character varying
);


CREATE TABLE checkpoint_log (
    checkpoint_log_id integer NOT NULL,
    checkpoint_id integer,
    logged_timestamp timestamp without time zone DEFAULT now(),
    logged_by character varying,
    status boolean,
    is_current boolean DEFAULT true NOT NULL
);




