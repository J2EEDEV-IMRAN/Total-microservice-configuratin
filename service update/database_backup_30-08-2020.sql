PGDMP     2    7                x           choukash_erp_1_0_0     12.4 (Ubuntu 12.4-1.pgdg18.04+1)     12.4 (Ubuntu 12.4-1.pgdg18.04+1) �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                        0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    82583    choukash_erp_1_0_0    DATABASE     �   CREATE DATABASE choukash_erp_1_0_0 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
 "   DROP DATABASE choukash_erp_1_0_0;
                postgres    false                        2615    82584    contact_management    SCHEMA     "   CREATE SCHEMA contact_management;
     DROP SCHEMA contact_management;
                postgres    false                        2615    92044 	   inventory    SCHEMA        CREATE SCHEMA inventory;
    DROP SCHEMA inventory;
                postgres    false            
            2615    82585    location_management    SCHEMA     #   CREATE SCHEMA location_management;
 !   DROP SCHEMA location_management;
                postgres    false                        2615    82586    master_setup    SCHEMA        CREATE SCHEMA master_setup;
    DROP SCHEMA master_setup;
                postgres    false                        2615    91699    product_setup    SCHEMA        CREATE SCHEMA product_setup;
    DROP SCHEMA product_setup;
                postgres    false                        2615    90691    user_creation_authentication    SCHEMA     ,   CREATE SCHEMA user_creation_authentication;
 *   DROP SCHEMA user_creation_authentication;
                postgres    false                        2615    82588    user_management    SCHEMA        CREATE SCHEMA user_management;
    DROP SCHEMA user_management;
                postgres    false            \           1247    82590    enum_address_type    TYPE     k   CREATE TYPE contact_management.enum_address_type AS ENUM (
    'Default',
    'Invoice',
    'Delivery'
);
 0   DROP TYPE contact_management.enum_address_type;
       contact_management          postgres    false    7            "           1247    92142    enum_stock_barcode_state    TYPE     e   CREATE TYPE inventory.enum_stock_barcode_state AS ENUM (
    'Sold',
    'Damage',
    'In-stock'
);
 .   DROP TYPE inventory.enum_stock_barcode_state;
    	   inventory          postgres    false    14            �           1247    82598    enum_address_type    TYPE     l   CREATE TYPE location_management.enum_address_type AS ENUM (
    'Default',
    'Invoice',
    'Delivery'
);
 1   DROP TYPE location_management.enum_address_type;
       location_management          postgres    false    10            �           1247    82606    enum_address_type    TYPE     e   CREATE TYPE master_setup.enum_address_type AS ENUM (
    'Default',
    'Invoice',
    'Delivery'
);
 *   DROP TYPE master_setup.enum_address_type;
       master_setup          postgres    false    8            g           1247    91822    enum_dimension_type    TYPE     T   CREATE TYPE product_setup.enum_dimension_type AS ENUM (
    'Size',
    'Weight'
);
 -   DROP TYPE product_setup.enum_dimension_type;
       product_setup          postgres    false    13            	           1255    82613    uuid_generate_v1()    FUNCTION     �   CREATE FUNCTION contact_management.uuid_generate_v1() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v1';
 5   DROP FUNCTION contact_management.uuid_generate_v1();
       contact_management          postgres    false    7            
           1255    82614    uuid_generate_v1()    FUNCTION     �   CREATE FUNCTION location_management.uuid_generate_v1() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v1';
 6   DROP FUNCTION location_management.uuid_generate_v1();
       location_management          postgres    false    10                       1255    82615    uuid_generate_v1()    FUNCTION     �   CREATE FUNCTION master_setup.uuid_generate_v1() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v4';
 /   DROP FUNCTION master_setup.uuid_generate_v1();
       master_setup          postgres    false    8                       1255    91700    uuid_generate_v1()    FUNCTION     �   CREATE FUNCTION product_setup.uuid_generate_v1() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v1';
 0   DROP FUNCTION product_setup.uuid_generate_v1();
       product_setup          postgres    false    13                       1255    92101    uuid_generate_v1()    FUNCTION     �   CREATE FUNCTION public.uuid_generate_v1() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v1';
 )   DROP FUNCTION public.uuid_generate_v1();
       public          postgres    false                       1255    82617    uuid_generate_v1()    FUNCTION     �   CREATE FUNCTION user_management.uuid_generate_v1() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v1';
 2   DROP FUNCTION user_management.uuid_generate_v1();
       user_management          postgres    false    6            �            1259    82618    contact_accounting_rules    TABLE     S  CREATE TABLE contact_management.contact_accounting_rules (
    contact_accounting_rules_id uuid DEFAULT contact_management.uuid_generate_v1() NOT NULL,
    contact_id uuid NOT NULL,
    price_tier character varying,
    payment_term character varying,
    currency character varying,
    alt_gl_account character varying,
    tax_id character varying,
    store_no character varying,
    freight character varying,
    carrier_service character varying,
    shipping_term character varying,
    account_status character varying,
    credit_limit numeric,
    billing_company character varying,
    company_id character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL
);
 8   DROP TABLE contact_management.contact_accounting_rules;
       contact_management         heap    postgres    false    265    7                       1259    92824    contact_type    TABLE     �  CREATE TABLE contact_management.contact_type (
    contact_type_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    contact_type_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 ,   DROP TABLE contact_management.contact_type;
       contact_management         heap    postgres    false    270    7                       1259    92837    contact_type_sub_group    TABLE       CREATE TABLE contact_management.contact_type_sub_group (
    contact_sub_group_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    contact_sub_group_name character varying NOT NULL,
    contact_type_id uuid NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 6   DROP TABLE contact_management.contact_type_sub_group;
       contact_management         heap    postgres    false    270    7            �            1259    82627    contacts    TABLE     �  CREATE TABLE contact_management.contacts (
    contact_id uuid DEFAULT contact_management.uuid_generate_v1() NOT NULL,
    address_type contact_management.enum_address_type NOT NULL,
    contact_type_id uuid,
    contact_type_name character varying,
    contact_sub_group_id uuid,
    contact_sub_group_name character varying,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    business_name character varying NOT NULL,
    job_title character varying,
    location_type_id uuid,
    location_type_name character varying,
    open_address character varying,
    zip character varying,
    city character varying,
    country character varying,
    mobile character varying,
    telephone character varying,
    email character varying,
    website character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by character varying,
    updated_on timestamp without time zone,
    note character varying,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid,
    location_group_id uuid,
    location_group_name character varying,
    is_owner boolean DEFAULT false NOT NULL,
    image character varying
);
 (   DROP TABLE contact_management.contacts;
       contact_management         heap    postgres    false    265    7    604                       1259    92638    contacts_address    TABLE     �  CREATE TABLE contact_management.contacts_address (
    contacts_address_id uuid DEFAULT contact_management.uuid_generate_v1() NOT NULL,
    contact_id uuid NOT NULL,
    address_type contact_management.enum_address_type NOT NULL,
    open_address character varying,
    zip character varying,
    city character varying,
    country character varying,
    mobile character varying,
    telephone character varying,
    email character varying,
    website character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by character varying,
    updated_on timestamp without time zone,
    note character varying,
    is_active boolean DEFAULT true NOT NULL
);
 0   DROP TABLE contact_management.contacts_address;
       contact_management         heap    postgres    false    265    7    604            �            1259    82637    crm_customer_stage    TABLE     �  CREATE TABLE contact_management.crm_customer_stage (
    crm_customer_stage_id uuid DEFAULT contact_management.uuid_generate_v1() NOT NULL,
    crm_customer_stage_name character varying NOT NULL,
    contact_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL
);
 2   DROP TABLE contact_management.crm_customer_stage;
       contact_management         heap    postgres    false    265    7            �            1259    92102 	   inv_stock    TABLE     F  CREATE TABLE inventory.inv_stock (
    stock_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    inventory_type_name character varying NOT NULL,
    location_id uuid NOT NULL,
    location_name uuid NOT NULL,
    location_group_id uuid NOT NULL,
    location_group_name uuid NOT NULL,
    product_id uuid NOT NULL,
    total_qty numeric(25,2) DEFAULT 0 NOT NULL,
    min_qty numeric(25,2) DEFAULT 0 NOT NULL,
    purchase_ordered_qty numeric(25,2) DEFAULT 0 NOT NULL,
    committed_qty numeric(25,2) DEFAULT 0 NOT NULL,
    available_qty numeric(25,2) DEFAULT 0 NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
     DROP TABLE inventory.inv_stock;
    	   inventory         heap    postgres    false    270    14            �            1259    92118    inv_stock_details    TABLE     �  CREATE TABLE inventory.inv_stock_details (
    stock_dtl_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    stock_id uuid NOT NULL,
    quantity numeric(25,2) DEFAULT 0 NOT NULL,
    batch_no character varying,
    expiry_date timestamp without time zone DEFAULT timezone('utc'::text, now()),
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 (   DROP TABLE inventory.inv_stock_details;
    	   inventory         heap    postgres    false    270    14            �            1259    92149    inv_stock_details_barcode    TABLE     A  CREATE TABLE inventory.inv_stock_details_barcode (
    barcode_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    uom_type_name character varying NOT NULL,
    barcode character varying NOT NULL,
    stock_dtl_id uuid NOT NULL,
    quantity numeric(25,2) DEFAULT 0 NOT NULL,
    product_id uuid NOT NULL,
    location_id uuid NOT NULL,
    location_name character varying NOT NULL,
    location_group_id uuid NOT NULL,
    location_group_name character varying NOT NULL,
    location_details_id uuid,
    state inventory.enum_stock_barcode_state DEFAULT 'In-stock'::inventory.enum_stock_barcode_state NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 0   DROP TABLE inventory.inv_stock_details_barcode;
    	   inventory         heap    postgres    false    270    802    14    802            �            1259    92130     inv_stock_under_location_details    TABLE     �  CREATE TABLE inventory.inv_stock_under_location_details (
    stock_within_loc_dtl_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    stock_dtl_id uuid NOT NULL,
    stock_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity numeric(25,2) DEFAULT 0 NOT NULL,
    location_id uuid NOT NULL,
    location_name character varying NOT NULL,
    location_group_id uuid NOT NULL,
    location_group_name character varying NOT NULL,
    location_details_id uuid NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 7   DROP TABLE inventory.inv_stock_under_location_details;
    	   inventory         heap    postgres    false    270    14            �            1259    82646    location_accounting_rules    TABLE     v  CREATE TABLE location_management.location_accounting_rules (
    location_accounting_rules_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    location_id uuid NOT NULL,
    company_id uuid NOT NULL,
    price_tier character varying,
    freight character varying,
    currency character varying,
    alt_gl_account character varying,
    tax_id character varying,
    store_no character varying,
    created_by uuid,
    is_active boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 :   DROP TABLE location_management.location_accounting_rules;
       location_management         heap    postgres    false    267    10            �            1259    82655    location_details    TABLE     	  CREATE TABLE location_management.location_details (
    location_details_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    location_type_id uuid NOT NULL,
    location_group_id uuid NOT NULL,
    business_name character varying NOT NULL,
    company_id uuid NOT NULL,
    level_name character varying NOT NULL,
    name_of_locations character varying NOT NULL,
    starting_name character varying NOT NULL,
    level_delimiter character varying NOT NULL,
    system_entity_id uuid NOT NULL,
    system_entity_name character varying NOT NULL,
    created_by uuid,
    is_active boolean DEFAULT true NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 1   DROP TABLE location_management.location_details;
       location_management         heap    postgres    false    267    10            �            1259    82664    location_group    TABLE       CREATE TABLE location_management.location_group (
    location_group_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    location_group_name character varying NOT NULL,
    location_type_id uuid NOT NULL,
    description character varying,
    properties character varying,
    is_active boolean DEFAULT true NOT NULL,
    short_name character varying,
    updated_on timestamp without time zone,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    created_by uuid,
    updated_by uuid
);
 /   DROP TABLE location_management.location_group;
       location_management         heap    postgres    false    267    10            �            1259    82673    location_type    TABLE     �  CREATE TABLE location_management.location_type (
    location_type_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    location_type_name character varying NOT NULL,
    description character varying,
    properties character varying,
    is_active boolean DEFAULT true NOT NULL,
    updated_on timestamp without time zone,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    created_by uuid,
    updated_by uuid
);
 .   DROP TABLE location_management.location_type;
       location_management         heap    postgres    false    267    10            �            1259    82682 	   locations    TABLE     �  CREATE TABLE location_management.locations (
    location_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    location_name character varying,
    location_type_id uuid NOT NULL,
    location_group_id uuid NOT NULL,
    business_name character varying NOT NULL,
    company_id uuid NOT NULL,
    contact_type_id uuid,
    contact_sub_group_id uuid,
    address_type master_setup.enum_address_type NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    job_title character varying NOT NULL,
    open_address character varying,
    zip character varying,
    city character varying,
    country character varying,
    mobile character varying,
    telephone character varying,
    email character varying,
    website character varying,
    is_active boolean DEFAULT true NOT NULL,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 *   DROP TABLE location_management.locations;
       location_management         heap    postgres    false    267    695    10            �            1259    82691    business_type    TABLE     �  CREATE TABLE master_setup.business_type (
    business_type_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    business_type_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 '   DROP TABLE master_setup.business_type;
       master_setup         heap    postgres    false    267    8            �            1259    82700    company    TABLE     �  CREATE TABLE master_setup.company (
    company_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    business_name character varying NOT NULL,
    business_legal_name character varying NOT NULL,
    business_type character varying NOT NULL,
    tax_id character varying(250) NOT NULL,
    ssn character varying NOT NULL,
    industry character varying NOT NULL,
    date_of_establishment timestamp without time zone NOT NULL,
    company_logo character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    is_active boolean DEFAULT true NOT NULL,
    updated_on timestamp without time zone
);
 !   DROP TABLE master_setup.company;
       master_setup         heap    postgres    false    267    8            �            1259    82709    contact_type    TABLE     �  CREATE TABLE master_setup.contact_type (
    contact_type_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    contact_type_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 &   DROP TABLE master_setup.contact_type;
       master_setup         heap    postgres    false    267    8            �            1259    82718    contact_type_sub_group    TABLE       CREATE TABLE master_setup.contact_type_sub_group (
    contact_sub_group_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    contact_sub_group_name character varying NOT NULL,
    contact_type_id uuid NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 0   DROP TABLE master_setup.contact_type_sub_group;
       master_setup         heap    postgres    false    267    8            �            1259    82727    industry    TABLE     �  CREATE TABLE master_setup.industry (
    industry_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    industry_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 "   DROP TABLE master_setup.industry;
       master_setup         heap    postgres    false    267    8            �            1259    82781    system_entity    TABLE     �  CREATE TABLE master_setup.system_entity (
    entity_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    entity_name character varying NOT NULL,
    entity_type uuid NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 '   DROP TABLE master_setup.system_entity;
       master_setup         heap    postgres    false    267    8            �            1259    82790    system_entity_type    TABLE     �  CREATE TABLE master_setup.system_entity_type (
    entity_type_id uuid DEFAULT master_setup.uuid_generate_v1() NOT NULL,
    entity_type_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 ,   DROP TABLE master_setup.system_entity_type;
       master_setup         heap    postgres    false    267    8            �            1259    91703    inventory_type    TABLE     �  CREATE TABLE product_setup.inventory_type (
    inventory_type_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    inventory_type_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 )   DROP TABLE product_setup.inventory_type;
       product_setup         heap    postgres    false    269    13            �            1259    91964    product_accounts    TABLE     �  CREATE TABLE product_setup.product_accounts (
    product_account_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    inventory_asset_account_id uuid NOT NULL,
    inventory_asset_account character varying NOT NULL,
    sales_income_account_id uuid NOT NULL,
    sales_income_account character varying NOT NULL,
    cgs_expense_account_id uuid NOT NULL,
    cgs_expense_account character varying NOT NULL,
    sales_tax_category_id uuid NOT NULL,
    sales_tax_category character varying NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_on timestamp without time zone,
    created_by character varying(255),
    updated_by character varying(255)
);
 +   DROP TABLE product_setup.product_accounts;
       product_setup         heap    postgres    false    269    13            �            1259    91729    product_brand    TABLE       CREATE TABLE product_setup.product_brand (
    product_brand_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_brand_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    company_id uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_on timestamp without time zone,
    updated_by character varying(255),
    created_by character varying(255)
);
 (   DROP TABLE product_setup.product_brand;
       product_setup         heap    postgres    false    269    13            �            1259    91716    product_category    TABLE       CREATE TABLE product_setup.product_category (
    product_category_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_category_name character varying NOT NULL,
    parent_id uuid,
    is_active boolean DEFAULT true NOT NULL,
    description character varying,
    properties character varying,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 +   DROP TABLE product_setup.product_category;
       product_setup         heap    postgres    false    269    13            �            1259    91906    product_cost    TABLE     �  CREATE TABLE product_setup.product_cost (
    product_cost_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    cost_method_id uuid NOT NULL,
    cost_method character varying NOT NULL,
    cost_amount numeric(25,2) DEFAULT 0 NOT NULL,
    uom_id uuid NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 '   DROP TABLE product_setup.product_cost;
       product_setup         heap    postgres    false    269    13            �            1259    91919    product_currency_cost    TABLE     �  CREATE TABLE product_setup.product_currency_cost (
    product_currency_cost_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    uom_id uuid NOT NULL,
    currency character varying NOT NULL,
    cost_amount numeric(25,2) DEFAULT 0 NOT NULL,
    exchange_rate numeric(25,2) DEFAULT 0 NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 0   DROP TABLE product_setup.product_currency_cost;
       product_setup         heap    postgres    false    269    13            �            1259    91950    product_currency_price    TABLE     �  CREATE TABLE product_setup.product_currency_price (
    product_currency_price_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    purchase_uom_id uuid NOT NULL,
    sales_uom_id uuid NOT NULL,
    currency character varying NOT NULL,
    sales_price numeric(25,2) DEFAULT 0 NOT NULL,
    exchange_rate numeric(25,2) DEFAULT 0 NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 1   DROP TABLE product_setup.product_currency_price;
       product_setup         heap    postgres    false    269    13            �            1259    91827    product_dimension    TABLE     <  CREATE TABLE product_setup.product_dimension (
    product_dimension_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    dimension_type product_setup.enum_dimension_type NOT NULL,
    dimension_uom_id uuid NOT NULL,
    dimension_properties character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 ,   DROP TABLE product_setup.product_dimension;
       product_setup         heap    postgres    false    269    871    13            �            1259    91854    product_locations    TABLE     I  CREATE TABLE product_setup.product_locations (
    product_location_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    location_group_id uuid NOT NULL,
    location_group_name character varying NOT NULL,
    location_id uuid NOT NULL,
    location_name character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 ,   DROP TABLE product_setup.product_locations;
       product_setup         heap    postgres    false    269    13            �            1259    91781    product_master    TABLE     �  CREATE TABLE product_setup.product_master (
    product_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_name character varying NOT NULL,
    product_code character varying,
    inventory_type_id uuid NOT NULL,
    product_brand_id uuid NOT NULL,
    product_category_id uuid NOT NULL,
    product_serial_no integer,
    stock_control_method character varying,
    purchase_uom_id uuid,
    sales_uom_id uuid,
    stock_uom_id uuid,
    product_image character varying,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 )   DROP TABLE product_setup.product_master;
       product_setup         heap    postgres    false    269    13            �            1259    91933    product_price    TABLE     �  CREATE TABLE product_setup.product_price (
    product_price_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    purchase_uom_id uuid NOT NULL,
    sales_uom_id uuid NOT NULL,
    cost_amount numeric(25,2) DEFAULT 0 NOT NULL,
    sales_price numeric(25,2) DEFAULT 0 NOT NULL,
    markup_percentage numeric(25,2) DEFAULT 0 NOT NULL,
    markup_value numeric(25,2) DEFAULT 0 NOT NULL,
    markup_calculated_price numeric(25,2) DEFAULT 0 NOT NULL,
    margin_percentage numeric(25,2) DEFAULT 0 NOT NULL,
    margin_ratio numeric(25,2) DEFAULT 0 NOT NULL,
    margin_calculated_price numeric(25,2) DEFAULT 0 NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 (   DROP TABLE product_setup.product_price;
       product_setup         heap    postgres    false    269    13            �            1259    92255    product_reorder_level    TABLE     �  CREATE TABLE product_setup.product_reorder_level (
    product_reorder_level_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    location_group_id uuid NOT NULL,
    location_group_name character varying NOT NULL,
    reorder_point numeric(25,2) DEFAULT 0 NOT NULL,
    order_upto_level numeric(25,2) DEFAULT 0 NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 0   DROP TABLE product_setup.product_reorder_level;
       product_setup         heap    postgres    false    270    13            �            1259    91866    product_reorder_point_tool    TABLE     U  CREATE TABLE product_setup.product_reorder_point_tool (
    product_reorder_point_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    location_group_id uuid NOT NULL,
    location_group_name character varying NOT NULL,
    start_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    unit_sales_per_day numeric(25,2) DEFAULT 0 NOT NULL,
    forecast_percentage numeric(25,2) DEFAULT 0 NOT NULL,
    desired_unit_sales_per_day numeric(25,2) DEFAULT 0 NOT NULL,
    lead_time integer DEFAULT 0 NOT NULL,
    lead_time_demand integer DEFAULT 0 NOT NULL,
    reorder_point numeric(25,2) DEFAULT 0 NOT NULL,
    order_upto_level numeric(25,2) DEFAULT 0 NOT NULL,
    effective_start timestamp without time zone NOT NULL,
    effective_end timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 5   DROP TABLE product_setup.product_reorder_point_tool;
       product_setup         heap    postgres    false    269    13            �            1259    91797    product_uom    TABLE     4  CREATE TABLE product_setup.product_uom (
    product_uom_id uuid DEFAULT product_setup.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    base_uom_id uuid NOT NULL,
    alt_uom_id uuid,
    alt_uom_code character varying,
    base_alt_uom_policy character varying,
    multiply_by integer,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 &   DROP TABLE product_setup.product_uom;
       product_setup         heap    postgres    false    269    13                       1259    92784    product_variant    TABLE       CREATE TABLE product_setup.product_variant (
    product_variant_id uuid DEFAULT public.uuid_generate_v1() NOT NULL,
    product_id uuid NOT NULL,
    variant_attribute_name character varying NOT NULL,
    variant_attribute_value character varying NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    company_id uuid NOT NULL,
    created_by uuid NOT NULL,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone
);
 *   DROP TABLE product_setup.product_variant;
       product_setup         heap    postgres    false    270    13                        1259    92567    product_vendor    TABLE     �  CREATE TABLE product_setup.product_vendor (
    product_vendor_id uuid NOT NULL,
    created_by character varying(255),
    created_on timestamp without time zone,
    updated_by character varying(255),
    updated_on timestamp without time zone,
    company_id uuid NOT NULL,
    is_active boolean NOT NULL,
    is_default boolean NOT NULL,
    last_cost numeric(19,2) NOT NULL,
    last_purchase_date timestamp without time zone NOT NULL,
    lead_days integer NOT NULL,
    part_no character varying(255) NOT NULL,
    product_id uuid NOT NULL,
    purchase_uom_id uuid NOT NULL,
    vendor_id uuid NOT NULL,
    vendor_name character varying(255) NOT NULL
);
 )   DROP TABLE product_setup.product_vendor;
       product_setup         heap    postgres    false    13                       1259    92809    stock_control_method    TABLE       CREATE TABLE product_setup.stock_control_method (
    stock_control_method_id uuid NOT NULL,
    created_by uuid,
    created_on timestamp without time zone,
    updated_by uuid,
    updated_on timestamp without time zone,
    abbreviation character varying(255) NOT NULL,
    company_id uuid NOT NULL,
    description character varying(255),
    input_type character varying(255) NOT NULL,
    is_active boolean NOT NULL,
    properties character varying(255),
    stock_control_method_name character varying(255) NOT NULL
);
 /   DROP TABLE product_setup.stock_control_method;
       product_setup         heap    postgres    false    13                       1259    92599    unit_of_measurement    TABLE     �  CREATE TABLE product_setup.unit_of_measurement (
    uom_id uuid NOT NULL,
    created_by uuid,
    created_on timestamp without time zone,
    updated_by uuid,
    updated_on timestamp without time zone,
    description character varying(255),
    is_active boolean NOT NULL,
    properties character varying(255),
    uom_name character varying(255) NOT NULL,
    uom_type_name character varying(255) NOT NULL
);
 .   DROP TABLE product_setup.unit_of_measurement;
       product_setup         heap    postgres    false    13                       1259    92607    uom_type    TABLE     �  CREATE TABLE product_setup.uom_type (
    uom_type_id uuid NOT NULL,
    created_by uuid,
    created_on timestamp without time zone,
    updated_by uuid,
    updated_on timestamp without time zone,
    company_id uuid NOT NULL,
    description character varying(255),
    is_active boolean NOT NULL,
    properties character varying(255),
    uom_type_name character varying(255) NOT NULL
);
 #   DROP TABLE product_setup.uom_type;
       product_setup         heap    postgres    false    13            �            1259    91535    hibernate_sequence    SEQUENCE     {   CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hibernate_sequence;
       public          postgres    false            �            1259    90692    hibernate_sequence    SEQUENCE     �   CREATE SEQUENCE user_creation_authentication.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE user_creation_authentication.hibernate_sequence;
       user_creation_authentication          postgres    false    11            �            1259    91446    oauth_access_token    TABLE     5  CREATE TABLE user_creation_authentication.oauth_access_token (
    token_id character varying(255),
    token bytea,
    authentication_id character varying(255),
    user_name character varying(255),
    client_id character varying(255),
    authentication bytea,
    refresh_token character varying(255)
);
 <   DROP TABLE user_creation_authentication.oauth_access_token;
       user_creation_authentication         heap    postgres    false    11            �            1259    91432    oauth_client_details    TABLE       CREATE TABLE user_creation_authentication.oauth_client_details (
    client_id character varying(256) NOT NULL,
    resource_ids character varying(256),
    client_secret character varying(256),
    scope character varying(256),
    authorized_grant_types character varying(256),
    web_server_redirect_uri character varying(256),
    authorities character varying(256),
    access_token_validity integer,
    refresh_token_validity integer,
    additional_information character varying(4096),
    autoapprove character varying(256)
);
 >   DROP TABLE user_creation_authentication.oauth_client_details;
       user_creation_authentication         heap    postgres    false    11            �            1259    91440    oauth_client_token    TABLE     �   CREATE TABLE user_creation_authentication.oauth_client_token (
    token_id character varying(255),
    token bytea,
    authentication_id character varying(255),
    user_name character varying(255),
    client_id character varying(255)
);
 <   DROP TABLE user_creation_authentication.oauth_client_token;
       user_creation_authentication         heap    postgres    false    11            �            1259    91458 
   oauth_code    TABLE     t   CREATE TABLE user_creation_authentication.oauth_code (
    code character varying(255),
    authentication bytea
);
 4   DROP TABLE user_creation_authentication.oauth_code;
       user_creation_authentication         heap    postgres    false    11            �            1259    91452    oauth_refresh_token    TABLE     �   CREATE TABLE user_creation_authentication.oauth_refresh_token (
    token_id character varying(255),
    token bytea,
    authentication bytea
);
 =   DROP TABLE user_creation_authentication.oauth_refresh_token;
       user_creation_authentication         heap    postgres    false    11                       1259    92722    password_reset_token    TABLE     N  CREATE TABLE user_creation_authentication.password_reset_token (
    id uuid NOT NULL,
    created_by uuid,
    created_on timestamp without time zone,
    updated_by uuid,
    updated_on timestamp without time zone,
    expiry_date timestamp without time zone,
    token character varying(255) NOT NULL,
    user_id uuid NOT NULL
);
 >   DROP TABLE user_creation_authentication.password_reset_token;
       user_creation_authentication         heap    postgres    false    11            �            1259    92485 
   user_roles    TABLE     �  CREATE TABLE user_creation_authentication.user_roles (
    id uuid NOT NULL,
    description character varying(255),
    role_name character varying(255),
    created_on timestamp without time zone,
    updated_by uuid,
    updated_on timestamp without time zone,
    created_by uuid,
    creation_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone
);
 4   DROP TABLE user_creation_authentication.user_roles;
       user_creation_authentication         heap    postgres    false    11            �            1259    92493    users    TABLE     �  CREATE TABLE user_creation_authentication.users (
    id uuid NOT NULL,
    active boolean,
    confirm_account_token character varying(255),
    first_name character varying(255) NOT NULL,
    is_email_otp_active boolean,
    is_mobile_otp_active boolean,
    last_name character varying(255) NOT NULL,
    location_group uuid,
    location_type uuid,
    password character varying(255) NOT NULL,
    primary_email character varying(255),
    primary_mobile character varying(255),
    short_description character varying(255),
    user_id character varying(255),
    user_name character varying(255),
    created_on timestamp without time zone,
    updated_by uuid,
    updated_on timestamp without time zone,
    created_by uuid
);
 /   DROP TABLE user_creation_authentication.users;
       user_creation_authentication         heap    postgres    false    11            �            1259    92527    users_roles    TABLE     p   CREATE TABLE user_creation_authentication.users_roles (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);
 5   DROP TABLE user_creation_authentication.users_roles;
       user_creation_authentication         heap    postgres    false    11            �            1259    83122    hibernate_sequence    SEQUENCE     �   CREATE SEQUENCE user_management.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE user_management.hibernate_sequence;
       user_management          postgres    false    6            �            1259    82870    password_reset_tokens    TABLE     �   CREATE TABLE user_management.password_reset_tokens (
    id uuid DEFAULT user_management.uuid_generate_v1() NOT NULL,
    token character varying,
    user_id uuid
);
 2   DROP TABLE user_management.password_reset_tokens;
       user_management         heap    postgres    false    268    6            �            1259    82877 
   user_group    TABLE       CREATE TABLE user_management.user_group (
    user_group_id uuid DEFAULT user_management.uuid_generate_v1() NOT NULL,
    user_group_name character varying NOT NULL,
    location_type_id uuid,
    location_type_name character varying,
    location_id uuid,
    company_id uuid,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    updated_on timestamp without time zone,
    note character varying,
    is_active boolean DEFAULT true NOT NULL
);
 '   DROP TABLE user_management.user_group;
       user_management         heap    postgres    false    268    6            �            1259    82886 	   user_info    TABLE     9  CREATE TABLE user_management.user_info (
    user_id uuid DEFAULT user_management.uuid_generate_v1() NOT NULL,
    first_name character varying NOT NULL,
    middle_name character varying,
    last_name character varying NOT NULL,
    email character varying NOT NULL,
    user_name character varying NOT NULL,
    password character varying NOT NULL,
    otp character varying,
    company_id uuid,
    location_id uuid,
    location_type_id uuid,
    location_type_name character varying,
    due_date_lock_profile timestamp without time zone,
    created_by uuid,
    created_on timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL,
    updated_by uuid,
    user_group character varying,
    note character varying,
    emailverificationtoken character varying,
    emailverificationstatus boolean DEFAULT false NOT NULL,
    otptimelimit character varying,
    updated_on timestamp without time zone,
    is_active boolean DEFAULT true NOT NULL,
    location_group_id uuid,
    location_group_name character varying,
    user_group_id character varying
);
 &   DROP TABLE user_management.user_info;
       user_management         heap    postgres    false    268    6            �          0    82618    contact_accounting_rules 
   TABLE DATA           L  COPY contact_management.contact_accounting_rules (contact_accounting_rules_id, contact_id, price_tier, payment_term, currency, alt_gl_account, tax_id, store_no, freight, carrier_service, shipping_term, account_status, credit_limit, billing_company, company_id, created_by, created_on, updated_by, updated_on, is_active) FROM stdin;
    contact_management          postgres    false    209   �      �          0    92824    contact_type 
   TABLE DATA           �   COPY contact_management.contact_type (contact_type_id, contact_type_name, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    contact_management          postgres    false    263   b�      �          0    92837    contact_type_sub_group 
   TABLE DATA           �   COPY contact_management.contact_type_sub_group (contact_sub_group_id, contact_sub_group_name, contact_type_id, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    contact_management          postgres    false    264   �      �          0    82627    contacts 
   TABLE DATA           �  COPY contact_management.contacts (contact_id, address_type, contact_type_id, contact_type_name, contact_sub_group_id, contact_sub_group_name, first_name, last_name, business_name, job_title, location_type_id, location_type_name, open_address, zip, city, country, mobile, telephone, email, website, created_by, created_on, updated_by, updated_on, note, is_active, company_id, location_group_id, location_group_name, is_owner, image) FROM stdin;
    contact_management          postgres    false    210   ��      �          0    92638    contacts_address 
   TABLE DATA           �   COPY contact_management.contacts_address (contacts_address_id, contact_id, address_type, open_address, zip, city, country, mobile, telephone, email, website, created_by, created_on, updated_by, updated_on, note, is_active) FROM stdin;
    contact_management          postgres    false    259   ߦ      �          0    82637    crm_customer_stage 
   TABLE DATA           �   COPY contact_management.crm_customer_stage (crm_customer_stage_id, crm_customer_stage_name, contact_id, created_by, created_on, updated_by, updated_on, is_active) FROM stdin;
    contact_management          postgres    false    211   Ч      �          0    92102 	   inv_stock 
   TABLE DATA           $  COPY inventory.inv_stock (stock_id, inventory_type_name, location_id, location_name, location_group_id, location_group_name, product_id, total_qty, min_qty, purchase_ordered_qty, committed_qty, available_qty, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
 	   inventory          postgres    false    248   ?�      �          0    92118    inv_stock_details 
   TABLE DATA           �   COPY inventory.inv_stock_details (stock_dtl_id, stock_id, quantity, batch_no, expiry_date, created_by, created_on, updated_by, updated_on) FROM stdin;
 	   inventory          postgres    false    249   \�      �          0    92149    inv_stock_details_barcode 
   TABLE DATA             COPY inventory.inv_stock_details_barcode (barcode_id, uom_type_name, barcode, stock_dtl_id, quantity, product_id, location_id, location_name, location_group_id, location_group_name, location_details_id, state, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
 	   inventory          postgres    false    251   y�      �          0    92130     inv_stock_under_location_details 
   TABLE DATA             COPY inventory.inv_stock_under_location_details (stock_within_loc_dtl_id, stock_dtl_id, stock_id, product_id, quantity, location_id, location_name, location_group_id, location_group_name, location_details_id, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
 	   inventory          postgres    false    250   ��      �          0    82646    location_accounting_rules 
   TABLE DATA           �   COPY location_management.location_accounting_rules (location_accounting_rules_id, location_id, company_id, price_tier, freight, currency, alt_gl_account, tax_id, store_no, created_by, is_active, created_on, updated_by, updated_on) FROM stdin;
    location_management          postgres    false    212   ��      �          0    82655    location_details 
   TABLE DATA           ,  COPY location_management.location_details (location_details_id, location_type_id, location_group_id, business_name, company_id, level_name, name_of_locations, starting_name, level_delimiter, system_entity_id, system_entity_name, created_by, is_active, created_on, updated_by, updated_on) FROM stdin;
    location_management          postgres    false    213   ~�      �          0    82664    location_group 
   TABLE DATA           �   COPY location_management.location_group (location_group_id, location_group_name, location_type_id, description, properties, is_active, short_name, updated_on, created_on, created_by, updated_by) FROM stdin;
    location_management          postgres    false    214   ��      �          0    82673    location_type 
   TABLE DATA           �   COPY location_management.location_type (location_type_id, location_type_name, description, properties, is_active, updated_on, created_on, created_by, updated_by) FROM stdin;
    location_management          postgres    false    215   |�      �          0    82682 	   locations 
   TABLE DATA           c  COPY location_management.locations (location_id, location_name, location_type_id, location_group_id, business_name, company_id, contact_type_id, contact_sub_group_id, address_type, first_name, last_name, job_title, open_address, zip, city, country, mobile, telephone, email, website, is_active, created_by, created_on, updated_by, updated_on) FROM stdin;
    location_management          postgres    false    216   $�      �          0    82691    business_type 
   TABLE DATA           �   COPY master_setup.business_type (business_type_id, business_type_name, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    master_setup          postgres    false    217   ۱      �          0    82700    company 
   TABLE DATA           �   COPY master_setup.company (company_id, business_name, business_legal_name, business_type, tax_id, ssn, industry, date_of_establishment, company_logo, created_by, created_on, updated_by, is_active, updated_on) FROM stdin;
    master_setup          postgres    false    218   ��      �          0    82709    contact_type 
   TABLE DATA           �   COPY master_setup.contact_type (contact_type_id, contact_type_name, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    master_setup          postgres    false    219   \�      �          0    82718    contact_type_sub_group 
   TABLE DATA           �   COPY master_setup.contact_type_sub_group (contact_sub_group_id, contact_sub_group_name, contact_type_id, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    master_setup          postgres    false    220   �      �          0    82727    industry 
   TABLE DATA           �   COPY master_setup.industry (industry_id, industry_name, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    master_setup          postgres    false    221   v�      �          0    82781    system_entity 
   TABLE DATA           �   COPY master_setup.system_entity (entity_id, entity_name, entity_type, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    master_setup          postgres    false    222   h�      �          0    82790    system_entity_type 
   TABLE DATA           �   COPY master_setup.system_entity_type (entity_type_id, entity_type_name, is_active, description, properties, created_by, created_on, updated_by, updated_on) FROM stdin;
    master_setup          postgres    false    223   i�      �          0    91703    inventory_type 
   TABLE DATA           �   COPY product_setup.inventory_type (inventory_type_id, inventory_type_name, is_active, description, properties, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    235   E�      �          0    91964    product_accounts 
   TABLE DATA           t  COPY product_setup.product_accounts (product_account_id, product_id, inventory_asset_account_id, inventory_asset_account, sales_income_account_id, sales_income_account, cgs_expense_account_id, cgs_expense_account, sales_tax_category_id, sales_tax_category, effective_start, effective_end, is_active, company_id, created_on, updated_on, created_by, updated_by) FROM stdin;
    product_setup          postgres    false    247   b�      �          0    91729    product_brand 
   TABLE DATA           �   COPY product_setup.product_brand (product_brand_id, product_brand_name, is_active, description, properties, company_id, created_on, updated_on, updated_by, created_by) FROM stdin;
    product_setup          postgres    false    237   �      �          0    91716    product_category 
   TABLE DATA           �   COPY product_setup.product_category (product_category_id, product_category_name, parent_id, is_active, description, properties, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    236   ��      �          0    91906    product_cost 
   TABLE DATA           �   COPY product_setup.product_cost (product_cost_id, product_id, cost_method_id, cost_method, cost_amount, uom_id, effective_start, effective_end, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    243   ��      �          0    91919    product_currency_cost 
   TABLE DATA           �   COPY product_setup.product_currency_cost (product_currency_cost_id, product_id, uom_id, currency, cost_amount, exchange_rate, effective_start, effective_end, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    244   ��      �          0    91950    product_currency_price 
   TABLE DATA           
  COPY product_setup.product_currency_price (product_currency_price_id, product_id, purchase_uom_id, sales_uom_id, currency, sales_price, exchange_rate, effective_start, effective_end, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    246   ��      �          0    91827    product_dimension 
   TABLE DATA           �   COPY product_setup.product_dimension (product_dimension_id, product_id, dimension_type, dimension_uom_id, dimension_properties, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    240   �      �          0    91854    product_locations 
   TABLE DATA           �   COPY product_setup.product_locations (product_location_id, product_id, location_group_id, location_group_name, location_id, location_name, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    241   6�      �          0    91781    product_master 
   TABLE DATA           =  COPY product_setup.product_master (product_id, product_name, product_code, inventory_type_id, product_brand_id, product_category_id, product_serial_no, stock_control_method, purchase_uom_id, sales_uom_id, stock_uom_id, product_image, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    238   S�      �          0    91933    product_price 
   TABLE DATA           `  COPY product_setup.product_price (product_price_id, product_id, purchase_uom_id, sales_uom_id, cost_amount, sales_price, markup_percentage, markup_value, markup_calculated_price, margin_percentage, margin_ratio, margin_calculated_price, effective_start, effective_end, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    245   p�      �          0    92255    product_reorder_level 
   TABLE DATA             COPY product_setup.product_reorder_level (product_reorder_level_id, product_id, location_group_id, location_group_name, reorder_point, order_upto_level, effective_start, effective_end, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    252   �      �          0    91866    product_reorder_point_tool 
   TABLE DATA           �  COPY product_setup.product_reorder_point_tool (product_reorder_point_id, product_id, location_group_id, location_group_name, start_date, end_date, unit_sales_per_day, forecast_percentage, desired_unit_sales_per_day, lead_time, lead_time_demand, reorder_point, order_upto_level, effective_start, effective_end, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    242   ��      �          0    91797    product_uom 
   TABLE DATA           �   COPY product_setup.product_uom (product_uom_id, product_id, base_uom_id, alt_uom_id, alt_uom_code, base_alt_uom_policy, multiply_by, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    239   f�      �          0    92784    product_variant 
   TABLE DATA           �   COPY product_setup.product_variant (product_variant_id, product_id, variant_attribute_name, variant_attribute_value, is_active, company_id, created_by, created_on, updated_by, updated_on) FROM stdin;
    product_setup          postgres    false    261   �      �          0    92567    product_vendor 
   TABLE DATA           �   COPY product_setup.product_vendor (product_vendor_id, created_by, created_on, updated_by, updated_on, company_id, is_active, is_default, last_cost, last_purchase_date, lead_days, part_no, product_id, purchase_uom_id, vendor_id, vendor_name) FROM stdin;
    product_setup          postgres    false    256   )�      �          0    92809    stock_control_method 
   TABLE DATA           �   COPY product_setup.stock_control_method (stock_control_method_id, created_by, created_on, updated_by, updated_on, abbreviation, company_id, description, input_type, is_active, properties, stock_control_method_name) FROM stdin;
    product_setup          postgres    false    262   F�      �          0    92599    unit_of_measurement 
   TABLE DATA           �   COPY product_setup.unit_of_measurement (uom_id, created_by, created_on, updated_by, updated_on, description, is_active, properties, uom_name, uom_type_name) FROM stdin;
    product_setup          postgres    false    257   c�      �          0    92607    uom_type 
   TABLE DATA           �   COPY product_setup.uom_type (uom_type_id, created_by, created_on, updated_by, updated_on, company_id, description, is_active, properties, uom_type_name) FROM stdin;
    product_setup          postgres    false    258   ��      �          0    91446    oauth_access_token 
   TABLE DATA           �   COPY user_creation_authentication.oauth_access_token (token_id, token, authentication_id, user_name, client_id, authentication, refresh_token) FROM stdin;
    user_creation_authentication          postgres    false    231   o�      �          0    91432    oauth_client_details 
   TABLE DATA             COPY user_creation_authentication.oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types, web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove) FROM stdin;
    user_creation_authentication          postgres    false    229   �       �          0    91440    oauth_client_token 
   TABLE DATA           |   COPY user_creation_authentication.oauth_client_token (token_id, token, authentication_id, user_name, client_id) FROM stdin;
    user_creation_authentication          postgres    false    230   �      �          0    91458 
   oauth_code 
   TABLE DATA           P   COPY user_creation_authentication.oauth_code (code, authentication) FROM stdin;
    user_creation_authentication          postgres    false    233   �      �          0    91452    oauth_refresh_token 
   TABLE DATA           d   COPY user_creation_authentication.oauth_refresh_token (token_id, token, authentication) FROM stdin;
    user_creation_authentication          postgres    false    232   �      �          0    92722    password_reset_token 
   TABLE DATA           �   COPY user_creation_authentication.password_reset_token (id, created_by, created_on, updated_by, updated_on, expiry_date, token, user_id) FROM stdin;
    user_creation_authentication          postgres    false    260         �          0    92485 
   user_roles 
   TABLE DATA           �   COPY user_creation_authentication.user_roles (id, description, role_name, created_on, updated_by, updated_on, created_by, creation_date, last_modified_by, last_modified_date) FROM stdin;
    user_creation_authentication          postgres    false    253   3      �          0    92493    users 
   TABLE DATA           9  COPY user_creation_authentication.users (id, active, confirm_account_token, first_name, is_email_otp_active, is_mobile_otp_active, last_name, location_group, location_type, password, primary_email, primary_mobile, short_description, user_id, user_name, created_on, updated_by, updated_on, created_by) FROM stdin;
    user_creation_authentication          postgres    false    254   �      �          0    92527    users_roles 
   TABLE DATA           M   COPY user_creation_authentication.users_roles (user_id, role_id) FROM stdin;
    user_creation_authentication          postgres    false    255   �      �          0    82870    password_reset_tokens 
   TABLE DATA           L   COPY user_management.password_reset_tokens (id, token, user_id) FROM stdin;
    user_management          postgres    false    224   T      �          0    82877 
   user_group 
   TABLE DATA           �   COPY user_management.user_group (user_group_id, user_group_name, location_type_id, location_type_name, location_id, company_id, created_by, created_on, updated_by, updated_on, note, is_active) FROM stdin;
    user_management          postgres    false    225   I      �          0    82886 	   user_info 
   TABLE DATA           �  COPY user_management.user_info (user_id, first_name, middle_name, last_name, email, user_name, password, otp, company_id, location_id, location_type_id, location_type_name, due_date_lock_profile, created_by, created_on, updated_by, user_group, note, emailverificationtoken, emailverificationstatus, otptimelimit, updated_on, is_active, location_group_id, location_group_name, user_group_id) FROM stdin;
    user_management          postgres    false    226   <                 0    0    hibernate_sequence    SEQUENCE SET     A   SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);
          public          postgres    false    234                       0    0    hibernate_sequence    SEQUENCE SET     X   SELECT pg_catalog.setval('user_creation_authentication.hibernate_sequence', 109, true);
          user_creation_authentication          postgres    false    228                       0    0    hibernate_sequence    SEQUENCE SET     J   SELECT pg_catalog.setval('user_management.hibernate_sequence', 1, false);
          user_management          postgres    false    227            �           2606    82898 P   contact_accounting_rules contact_accounting_rules_contact_accounting_rules_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY contact_management.contact_accounting_rules
    ADD CONSTRAINT contact_accounting_rules_contact_accounting_rules_id_pk PRIMARY KEY (contact_accounting_rules_id);
 �   ALTER TABLE ONLY contact_management.contact_accounting_rules DROP CONSTRAINT contact_accounting_rules_contact_accounting_rules_id_pk;
       contact_management            postgres    false    209            ?           2606    92834 ,   contact_type contact_type_contact_type_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY contact_management.contact_type
    ADD CONSTRAINT contact_type_contact_type_id_pk PRIMARY KEY (contact_type_id);
 b   ALTER TABLE ONLY contact_management.contact_type DROP CONSTRAINT contact_type_contact_type_id_pk;
       contact_management            postgres    false    263            A           2606    92836 .   contact_type contact_type_contact_type_name_un 
   CONSTRAINT     �   ALTER TABLE ONLY contact_management.contact_type
    ADD CONSTRAINT contact_type_contact_type_name_un UNIQUE (contact_type_name);
 d   ALTER TABLE ONLY contact_management.contact_type DROP CONSTRAINT contact_type_contact_type_name_un;
       contact_management            postgres    false    263            C           2606    92847 E   contact_type_sub_group contact_type_sub_group_contact_sub_group_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY contact_management.contact_type_sub_group
    ADD CONSTRAINT contact_type_sub_group_contact_sub_group_id_pk PRIMARY KEY (contact_sub_group_id);
 {   ALTER TABLE ONLY contact_management.contact_type_sub_group DROP CONSTRAINT contact_type_sub_group_contact_sub_group_id_pk;
       contact_management            postgres    false    264            5           2606    92648 8   contacts_address contacts_address_contacts_address_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY contact_management.contacts_address
    ADD CONSTRAINT contacts_address_contacts_address_id_pk PRIMARY KEY (contacts_address_id);
 n   ALTER TABLE ONLY contact_management.contacts_address DROP CONSTRAINT contacts_address_contacts_address_id_pk;
       contact_management            postgres    false    259            �           2606    82900    contacts contacts_contact_id_pk 
   CONSTRAINT     q   ALTER TABLE ONLY contact_management.contacts
    ADD CONSTRAINT contacts_contact_id_pk PRIMARY KEY (contact_id);
 U   ALTER TABLE ONLY contact_management.contacts DROP CONSTRAINT contacts_contact_id_pk;
       contact_management            postgres    false    210            �           2606    82902 >   crm_customer_stage crm_customer_stage_crm_customer_stage_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY contact_management.crm_customer_stage
    ADD CONSTRAINT crm_customer_stage_crm_customer_stage_id_pk PRIMARY KEY (crm_customer_stage_id);
 t   ALTER TABLE ONLY contact_management.crm_customer_stage DROP CONSTRAINT crm_customer_stage_crm_customer_stage_id_pk;
       contact_management            postgres    false    211            "           2606    92160 A   inv_stock_details_barcode inv_stock_details_barcode_barcode_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY inventory.inv_stock_details_barcode
    ADD CONSTRAINT inv_stock_details_barcode_barcode_id_pk PRIMARY KEY (barcode_id);
 n   ALTER TABLE ONLY inventory.inv_stock_details_barcode DROP CONSTRAINT inv_stock_details_barcode_barcode_id_pk;
    	   inventory            postgres    false    251                       2606    92129 3   inv_stock_details inv_stock_details_stock_dtl_id_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY inventory.inv_stock_details
    ADD CONSTRAINT inv_stock_details_stock_dtl_id_pk PRIMARY KEY (stock_dtl_id);
 `   ALTER TABLE ONLY inventory.inv_stock_details DROP CONSTRAINT inv_stock_details_stock_dtl_id_pk;
    	   inventory            postgres    false    249                       2606    92117    inv_stock inv_stock_stock_id_pk 
   CONSTRAINT     f   ALTER TABLE ONLY inventory.inv_stock
    ADD CONSTRAINT inv_stock_stock_id_pk PRIMARY KEY (stock_id);
 L   ALTER TABLE ONLY inventory.inv_stock DROP CONSTRAINT inv_stock_stock_id_pk;
    	   inventory            postgres    false    248                        2606    92140 \   inv_stock_under_location_details inv_stock_under_location_details_stock_within_loc_dtl_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY inventory.inv_stock_under_location_details
    ADD CONSTRAINT inv_stock_under_location_details_stock_within_loc_dtl_id_pk PRIMARY KEY (stock_within_loc_dtl_id);
 �   ALTER TABLE ONLY inventory.inv_stock_under_location_details DROP CONSTRAINT inv_stock_under_location_details_stock_within_loc_dtl_id_pk;
    	   inventory            postgres    false    250            �           2606    92621 S   location_accounting_rules location_accounting_rules_location_accounting_rules_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_accounting_rules
    ADD CONSTRAINT location_accounting_rules_location_accounting_rules_id_pk PRIMARY KEY (location_accounting_rules_id);
 �   ALTER TABLE ONLY location_management.location_accounting_rules DROP CONSTRAINT location_accounting_rules_location_accounting_rules_id_pk;
       location_management            postgres    false    212            �           2606    92623 8   location_details location_details_location_details_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_details
    ADD CONSTRAINT location_details_location_details_id_pk PRIMARY KEY (location_details_id);
 o   ALTER TABLE ONLY location_management.location_details DROP CONSTRAINT location_details_location_details_id_pk;
       location_management            postgres    false    213            �           2606    92625 $   location_details location_details_un 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_details
    ADD CONSTRAINT location_details_un UNIQUE (location_type_id, company_id, system_entity_name);
 [   ALTER TABLE ONLY location_management.location_details DROP CONSTRAINT location_details_un;
       location_management            postgres    false    213    213    213            �           2606    92627 2   location_group location_group_location_group_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_group
    ADD CONSTRAINT location_group_location_group_id_pk PRIMARY KEY (location_group_id);
 i   ALTER TABLE ONLY location_management.location_group DROP CONSTRAINT location_group_location_group_id_pk;
       location_management            postgres    false    214            �           2606    92629 E   location_group location_group_location_type_id_location_group_name_un 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_group
    ADD CONSTRAINT location_group_location_type_id_location_group_name_un UNIQUE (location_type_id, location_group_name);
 |   ALTER TABLE ONLY location_management.location_group DROP CONSTRAINT location_group_location_type_id_location_group_name_un;
       location_management            postgres    false    214    214            �           2606    92631 /   location_type location_type_location_type_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_type
    ADD CONSTRAINT location_type_location_type_id_pk PRIMARY KEY (location_type_id);
 f   ALTER TABLE ONLY location_management.location_type DROP CONSTRAINT location_type_location_type_id_pk;
       location_management            postgres    false    215            �           2606    92633 1   location_type location_type_location_type_name_un 
   CONSTRAINT     �   ALTER TABLE ONLY location_management.location_type
    ADD CONSTRAINT location_type_location_type_name_un UNIQUE (location_type_name);
 h   ALTER TABLE ONLY location_management.location_type DROP CONSTRAINT location_type_location_type_name_un;
       location_management            postgres    false    215            �           2606    92635 "   locations locations_location_id_pk 
   CONSTRAINT     v   ALTER TABLE ONLY location_management.locations
    ADD CONSTRAINT locations_location_id_pk PRIMARY KEY (location_id);
 Y   ALTER TABLE ONLY location_management.locations DROP CONSTRAINT locations_location_id_pk;
       location_management            postgres    false    216            �           2606    92637 $   locations locations_location_name_un 
   CONSTRAINT     u   ALTER TABLE ONLY location_management.locations
    ADD CONSTRAINT locations_location_name_un UNIQUE (location_name);
 [   ALTER TABLE ONLY location_management.locations DROP CONSTRAINT locations_location_name_un;
       location_management            postgres    false    216            �           2606    82904 /   business_type business_type_business_type_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY master_setup.business_type
    ADD CONSTRAINT business_type_business_type_id_pk PRIMARY KEY (business_type_id);
 _   ALTER TABLE ONLY master_setup.business_type DROP CONSTRAINT business_type_business_type_id_pk;
       master_setup            postgres    false    217            �           2606    82906 #   business_type business_type_name_un 
   CONSTRAINT     r   ALTER TABLE ONLY master_setup.business_type
    ADD CONSTRAINT business_type_name_un UNIQUE (business_type_name);
 S   ALTER TABLE ONLY master_setup.business_type DROP CONSTRAINT business_type_name_un;
       master_setup            postgres    false    217            �           2606    82908     company company_business_name_un 
   CONSTRAINT     j   ALTER TABLE ONLY master_setup.company
    ADD CONSTRAINT company_business_name_un UNIQUE (business_name);
 P   ALTER TABLE ONLY master_setup.company DROP CONSTRAINT company_business_name_un;
       master_setup            postgres    false    218            �           2606    82910    company company_company_id_pk 
   CONSTRAINT     i   ALTER TABLE ONLY master_setup.company
    ADD CONSTRAINT company_company_id_pk PRIMARY KEY (company_id);
 M   ALTER TABLE ONLY master_setup.company DROP CONSTRAINT company_company_id_pk;
       master_setup            postgres    false    218            �           2606    82912 ,   contact_type contact_type_contact_type_id_pk 
   CONSTRAINT     }   ALTER TABLE ONLY master_setup.contact_type
    ADD CONSTRAINT contact_type_contact_type_id_pk PRIMARY KEY (contact_type_id);
 \   ALTER TABLE ONLY master_setup.contact_type DROP CONSTRAINT contact_type_contact_type_id_pk;
       master_setup            postgres    false    219            �           2606    82914 .   contact_type contact_type_contact_type_name_un 
   CONSTRAINT     |   ALTER TABLE ONLY master_setup.contact_type
    ADD CONSTRAINT contact_type_contact_type_name_un UNIQUE (contact_type_name);
 ^   ALTER TABLE ONLY master_setup.contact_type DROP CONSTRAINT contact_type_contact_type_name_un;
       master_setup            postgres    false    219            �           2606    82916 E   contact_type_sub_group contact_type_sub_group_contact_sub_group_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY master_setup.contact_type_sub_group
    ADD CONSTRAINT contact_type_sub_group_contact_sub_group_id_pk PRIMARY KEY (contact_sub_group_id);
 u   ALTER TABLE ONLY master_setup.contact_type_sub_group DROP CONSTRAINT contact_type_sub_group_contact_sub_group_id_pk;
       master_setup            postgres    false    220            �           2606    82918     industry industry_industry_id_pk 
   CONSTRAINT     m   ALTER TABLE ONLY master_setup.industry
    ADD CONSTRAINT industry_industry_id_pk PRIMARY KEY (industry_id);
 P   ALTER TABLE ONLY master_setup.industry DROP CONSTRAINT industry_industry_id_pk;
       master_setup            postgres    false    221            �           2606    82920 "   industry industry_industry_name_un 
   CONSTRAINT     l   ALTER TABLE ONLY master_setup.industry
    ADD CONSTRAINT industry_industry_name_un UNIQUE (industry_name);
 R   ALTER TABLE ONLY master_setup.industry DROP CONSTRAINT industry_industry_name_un;
       master_setup            postgres    false    221            �           2606    82938 (   system_entity system_entity_entity_id_pk 
   CONSTRAINT     s   ALTER TABLE ONLY master_setup.system_entity
    ADD CONSTRAINT system_entity_entity_id_pk PRIMARY KEY (entity_id);
 X   ALTER TABLE ONLY master_setup.system_entity DROP CONSTRAINT system_entity_entity_id_pk;
       master_setup            postgres    false    222            �           2606    82940 7   system_entity_type system_entity_type_entity_type_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY master_setup.system_entity_type
    ADD CONSTRAINT system_entity_type_entity_type_id_pk PRIMARY KEY (entity_type_id);
 g   ALTER TABLE ONLY master_setup.system_entity_type DROP CONSTRAINT system_entity_type_entity_type_id_pk;
       master_setup            postgres    false    223            �           2606    82942 (   system_entity system_entity_type_name_un 
   CONSTRAINT     }   ALTER TABLE ONLY master_setup.system_entity
    ADD CONSTRAINT system_entity_type_name_un UNIQUE (entity_name, entity_type);
 X   ALTER TABLE ONLY master_setup.system_entity DROP CONSTRAINT system_entity_type_name_un;
       master_setup            postgres    false    222    222            �           2606    82944 2   system_entity_type system_entity_type_type_name_un 
   CONSTRAINT        ALTER TABLE ONLY master_setup.system_entity_type
    ADD CONSTRAINT system_entity_type_type_name_un UNIQUE (entity_type_name);
 b   ALTER TABLE ONLY master_setup.system_entity_type DROP CONSTRAINT system_entity_type_type_name_un;
       master_setup            postgres    false    223            �           2606    91713 2   inventory_type inventory_type_inventory_type_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.inventory_type
    ADD CONSTRAINT inventory_type_inventory_type_id_pk PRIMARY KEY (inventory_type_id);
 c   ALTER TABLE ONLY product_setup.inventory_type DROP CONSTRAINT inventory_type_inventory_type_id_pk;
       product_setup            postgres    false    235            �           2606    91715 4   inventory_type inventory_type_inventory_type_name_un 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.inventory_type
    ADD CONSTRAINT inventory_type_inventory_type_name_un UNIQUE (inventory_type_name);
 e   ALTER TABLE ONLY product_setup.inventory_type DROP CONSTRAINT inventory_type_inventory_type_name_un;
       product_setup            postgres    false    235                       2606    91974 7   product_accounts product_accounts_product_account_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_accounts
    ADD CONSTRAINT product_accounts_product_account_id_pk PRIMARY KEY (product_account_id);
 h   ALTER TABLE ONLY product_setup.product_accounts DROP CONSTRAINT product_accounts_product_account_id_pk;
       product_setup            postgres    false    247            �           2606    91739 /   product_brand product_brand_product_brand_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_brand
    ADD CONSTRAINT product_brand_product_brand_id_pk PRIMARY KEY (product_brand_id);
 `   ALTER TABLE ONLY product_setup.product_brand DROP CONSTRAINT product_brand_product_brand_id_pk;
       product_setup            postgres    false    237            �           2606    91741 1   product_brand product_brand_product_brand_name_un 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_brand
    ADD CONSTRAINT product_brand_product_brand_name_un UNIQUE (product_brand_name);
 b   ALTER TABLE ONLY product_setup.product_brand DROP CONSTRAINT product_brand_product_brand_name_un;
       product_setup            postgres    false    237            �           2606    91726 8   product_category product_category_product_category_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_category
    ADD CONSTRAINT product_category_product_category_id_pk PRIMARY KEY (product_category_id);
 i   ALTER TABLE ONLY product_setup.product_category DROP CONSTRAINT product_category_product_category_id_pk;
       product_setup            postgres    false    236            �           2606    91728 :   product_category product_category_product_category_name_un 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_category
    ADD CONSTRAINT product_category_product_category_name_un UNIQUE (product_category_name);
 k   ALTER TABLE ONLY product_setup.product_category DROP CONSTRAINT product_category_product_category_name_un;
       product_setup            postgres    false    236                       2606    91917 ,   product_cost product_cost_product_cost_id_pk 
   CONSTRAINT     ~   ALTER TABLE ONLY product_setup.product_cost
    ADD CONSTRAINT product_cost_product_cost_id_pk PRIMARY KEY (product_cost_id);
 ]   ALTER TABLE ONLY product_setup.product_cost DROP CONSTRAINT product_cost_product_cost_id_pk;
       product_setup            postgres    false    243                       2606    91931 G   product_currency_cost product_currency_cost_product_currency_cost_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_currency_cost
    ADD CONSTRAINT product_currency_cost_product_currency_cost_id_pk PRIMARY KEY (product_currency_cost_id);
 x   ALTER TABLE ONLY product_setup.product_currency_cost DROP CONSTRAINT product_currency_cost_product_currency_cost_id_pk;
       product_setup            postgres    false    244                       2606    91962 I   product_currency_price product_currency_price_product_currency_cost_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_currency_price
    ADD CONSTRAINT product_currency_price_product_currency_cost_id_pk PRIMARY KEY (product_currency_price_id);
 z   ALTER TABLE ONLY product_setup.product_currency_price DROP CONSTRAINT product_currency_price_product_currency_cost_id_pk;
       product_setup            postgres    false    246                       2606    91837 ;   product_dimension product_dimension_product_dimension_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_dimension
    ADD CONSTRAINT product_dimension_product_dimension_id_pk PRIMARY KEY (product_dimension_id);
 l   ALTER TABLE ONLY product_setup.product_dimension DROP CONSTRAINT product_dimension_product_dimension_id_pk;
       product_setup            postgres    false    240                       2606    91864 <   product_locations product_location_id_product_location_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_locations
    ADD CONSTRAINT product_location_id_product_location_id_pk PRIMARY KEY (product_location_id);
 m   ALTER TABLE ONLY product_setup.product_locations DROP CONSTRAINT product_location_id_product_location_id_pk;
       product_setup            postgres    false    241            �           2606    91795 -   product_master product_master_product_code_un 
   CONSTRAINT     w   ALTER TABLE ONLY product_setup.product_master
    ADD CONSTRAINT product_master_product_code_un UNIQUE (product_code);
 ^   ALTER TABLE ONLY product_setup.product_master DROP CONSTRAINT product_master_product_code_un;
       product_setup            postgres    false    238            �           2606    91791 +   product_master product_master_product_id_pk 
   CONSTRAINT     x   ALTER TABLE ONLY product_setup.product_master
    ADD CONSTRAINT product_master_product_id_pk PRIMARY KEY (product_id);
 \   ALTER TABLE ONLY product_setup.product_master DROP CONSTRAINT product_master_product_id_pk;
       product_setup            postgres    false    238            �           2606    91793 -   product_master product_master_product_name_un 
   CONSTRAINT     w   ALTER TABLE ONLY product_setup.product_master
    ADD CONSTRAINT product_master_product_name_un UNIQUE (product_name);
 ^   ALTER TABLE ONLY product_setup.product_master DROP CONSTRAINT product_master_product_name_un;
       product_setup            postgres    false    238                       2606    91948 /   product_price product_price_product_price_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_price
    ADD CONSTRAINT product_price_product_price_id_pk PRIMARY KEY (product_price_id);
 `   ALTER TABLE ONLY product_setup.product_price DROP CONSTRAINT product_price_product_price_id_pk;
       product_setup            postgres    false    245            %           2606    92267 G   product_reorder_level product_reorder_level_product_reorder_level_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_reorder_level
    ADD CONSTRAINT product_reorder_level_product_reorder_level_id_pk PRIMARY KEY (product_reorder_level_id);
 x   ALTER TABLE ONLY product_setup.product_reorder_level DROP CONSTRAINT product_reorder_level_product_reorder_level_id_pk;
       product_setup            postgres    false    252                       2606    91883 Q   product_reorder_point_tool product_reorder_point_tool_product_reorder_point_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_reorder_point_tool
    ADD CONSTRAINT product_reorder_point_tool_product_reorder_point_id_pk PRIMARY KEY (product_reorder_point_id);
 �   ALTER TABLE ONLY product_setup.product_reorder_point_tool DROP CONSTRAINT product_reorder_point_tool_product_reorder_point_id_pk;
       product_setup            postgres    false    242                       2606    91807 )   product_uom product_uom_product_uom_id_pk 
   CONSTRAINT     z   ALTER TABLE ONLY product_setup.product_uom
    ADD CONSTRAINT product_uom_product_uom_id_pk PRIMARY KEY (product_uom_id);
 Z   ALTER TABLE ONLY product_setup.product_uom DROP CONSTRAINT product_uom_product_uom_id_pk;
       product_setup            postgres    false    239            ;           2606    92794 5   product_variant product_variant_product_variant_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.product_variant
    ADD CONSTRAINT product_variant_product_variant_id_pk PRIMARY KEY (product_variant_id);
 f   ALTER TABLE ONLY product_setup.product_variant DROP CONSTRAINT product_variant_product_variant_id_pk;
       product_setup            postgres    false    261            /           2606    92574 "   product_vendor product_vendor_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY product_setup.product_vendor
    ADD CONSTRAINT product_vendor_pkey PRIMARY KEY (product_vendor_id);
 S   ALTER TABLE ONLY product_setup.product_vendor DROP CONSTRAINT product_vendor_pkey;
       product_setup            postgres    false    256            =           2606    92816 .   stock_control_method stock_control_method_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY product_setup.stock_control_method
    ADD CONSTRAINT stock_control_method_pkey PRIMARY KEY (stock_control_method_id);
 _   ALTER TABLE ONLY product_setup.stock_control_method DROP CONSTRAINT stock_control_method_pkey;
       product_setup            postgres    false    262            1           2606    92606 ,   unit_of_measurement unit_of_measurement_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY product_setup.unit_of_measurement
    ADD CONSTRAINT unit_of_measurement_pkey PRIMARY KEY (uom_id);
 ]   ALTER TABLE ONLY product_setup.unit_of_measurement DROP CONSTRAINT unit_of_measurement_pkey;
       product_setup            postgres    false    257            3           2606    92614    uom_type uom_type_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY product_setup.uom_type
    ADD CONSTRAINT uom_type_pkey PRIMARY KEY (uom_type_id);
 G   ALTER TABLE ONLY product_setup.uom_type DROP CONSTRAINT uom_type_pkey;
       product_setup            postgres    false    258            �           2606    91439 .   oauth_client_details oauth_client_details_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY user_creation_authentication.oauth_client_details
    ADD CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id);
 n   ALTER TABLE ONLY user_creation_authentication.oauth_client_details DROP CONSTRAINT oauth_client_details_pkey;
       user_creation_authentication            postgres    false    229            7           2606    92726 .   password_reset_token password_reset_token_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY user_creation_authentication.password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY user_creation_authentication.password_reset_token DROP CONSTRAINT password_reset_token_pkey;
       user_creation_authentication            postgres    false    260            '           2606    92505 '   user_roles uk_40fvvy071dnqy9tywk6ei7f5r 
   CONSTRAINT     }   ALTER TABLE ONLY user_creation_authentication.user_roles
    ADD CONSTRAINT uk_40fvvy071dnqy9tywk6ei7f5r UNIQUE (role_name);
 g   ALTER TABLE ONLY user_creation_authentication.user_roles DROP CONSTRAINT uk_40fvvy071dnqy9tywk6ei7f5r;
       user_creation_authentication            postgres    false    253            9           2606    92728 1   password_reset_token uk_g0guo4k8krgpwuagos61oc06j 
   CONSTRAINT     �   ALTER TABLE ONLY user_creation_authentication.password_reset_token
    ADD CONSTRAINT uk_g0guo4k8krgpwuagos61oc06j UNIQUE (token);
 q   ALTER TABLE ONLY user_creation_authentication.password_reset_token DROP CONSTRAINT uk_g0guo4k8krgpwuagos61oc06j;
       user_creation_authentication            postgres    false    260            +           2606    92507 "   users uk_rf5m47pvq2fh48mh8wrbsrbns 
   CONSTRAINT     |   ALTER TABLE ONLY user_creation_authentication.users
    ADD CONSTRAINT uk_rf5m47pvq2fh48mh8wrbsrbns UNIQUE (primary_email);
 b   ALTER TABLE ONLY user_creation_authentication.users DROP CONSTRAINT uk_rf5m47pvq2fh48mh8wrbsrbns;
       user_creation_authentication            postgres    false    254            )           2606    92492    user_roles user_roles_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY user_creation_authentication.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY user_creation_authentication.user_roles DROP CONSTRAINT user_roles_pkey;
       user_creation_authentication            postgres    false    253            -           2606    92500    users users_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY user_creation_authentication.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY user_creation_authentication.users DROP CONSTRAINT users_pkey;
       user_creation_authentication            postgres    false    254            �           2606    82962 G   password_reset_tokens password_reset_tokens_password_reset_tokens_id_pk 
   CONSTRAINT     �   ALTER TABLE ONLY user_management.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_password_reset_tokens_id_pk PRIMARY KEY (id);
 z   ALTER TABLE ONLY user_management.password_reset_tokens DROP CONSTRAINT password_reset_tokens_password_reset_tokens_id_pk;
       user_management            postgres    false    224            �           2606    82964 &   user_group user_group_user_group_id_pk 
   CONSTRAINT     x   ALTER TABLE ONLY user_management.user_group
    ADD CONSTRAINT user_group_user_group_id_pk PRIMARY KEY (user_group_id);
 Y   ALTER TABLE ONLY user_management.user_group DROP CONSTRAINT user_group_user_group_id_pk;
       user_management            postgres    false    225            �           2606    82966 (   user_group user_group_user_group_name_un 
   CONSTRAINT     w   ALTER TABLE ONLY user_management.user_group
    ADD CONSTRAINT user_group_user_group_name_un UNIQUE (user_group_name);
 [   ALTER TABLE ONLY user_management.user_group DROP CONSTRAINT user_group_user_group_name_un;
       user_management            postgres    false    225            �           2606    82968    user_info user_info_user_id_pk 
   CONSTRAINT     j   ALTER TABLE ONLY user_management.user_info
    ADD CONSTRAINT user_info_user_id_pk PRIMARY KEY (user_id);
 Q   ALTER TABLE ONLY user_management.user_info DROP CONSTRAINT user_info_user_id_pk;
       user_management            postgres    false    226            �           2606    82970 &   user_info user_info_user_info_email_un 
   CONSTRAINT     k   ALTER TABLE ONLY user_management.user_info
    ADD CONSTRAINT user_info_user_info_email_un UNIQUE (email);
 Y   ALTER TABLE ONLY user_management.user_info DROP CONSTRAINT user_info_user_info_email_un;
       user_management            postgres    false    226            �           2606    82972     user_info user_info_user_name_un 
   CONSTRAINT     i   ALTER TABLE ONLY user_management.user_info
    ADD CONSTRAINT user_info_user_name_un UNIQUE (user_name);
 S   ALTER TABLE ONLY user_management.user_info DROP CONSTRAINT user_info_user_name_un;
       user_management            postgres    false    226            �           1259    90688    index_company_id    INDEX     `   CREATE INDEX index_company_id ON location_management.location_details USING btree (company_id);
 1   DROP INDEX location_management.index_company_id;
       location_management            postgres    false    213            �           1259    90689    index_location_group_id    INDEX     n   CREATE INDEX index_location_group_id ON location_management.location_details USING btree (location_group_id);
 8   DROP INDEX location_management.index_location_group_id;
       location_management            postgres    false    213            �           1259    90690    index_location_type_id    INDEX     l   CREATE INDEX index_location_type_id ON location_management.location_details USING btree (location_type_id);
 7   DROP INDEX location_management.index_location_type_id;
       location_management            postgres    false    213                       1259    91975    product_accounts_product_id_idx    INDEX     i   CREATE INDEX product_accounts_product_id_idx ON product_setup.product_accounts USING btree (product_id);
 :   DROP INDEX product_setup.product_accounts_product_id_idx;
       product_setup            postgres    false    247                       1259    91918    product_cost_product_id_idx    INDEX     a   CREATE INDEX product_cost_product_id_idx ON product_setup.product_cost USING btree (product_id);
 6   DROP INDEX product_setup.product_cost_product_id_idx;
       product_setup            postgres    false    243                       1259    91932 $   product_currency_cost_product_id_idx    INDEX     s   CREATE INDEX product_currency_cost_product_id_idx ON product_setup.product_currency_cost USING btree (product_id);
 ?   DROP INDEX product_setup.product_currency_cost_product_id_idx;
       product_setup            postgres    false    244                       1259    91963 %   product_currency_price_product_id_idx    INDEX     u   CREATE INDEX product_currency_price_product_id_idx ON product_setup.product_currency_price USING btree (product_id);
 @   DROP INDEX product_setup.product_currency_price_product_id_idx;
       product_setup            postgres    false    246                       1259    91838     product_dimension_product_id_idx    INDEX     k   CREATE INDEX product_dimension_product_id_idx ON product_setup.product_dimension USING btree (product_id);
 ;   DROP INDEX product_setup.product_dimension_product_id_idx;
       product_setup            postgres    false    240                       1259    91865     product_locations_product_id_idx    INDEX     k   CREATE INDEX product_locations_product_id_idx ON product_setup.product_locations USING btree (product_id);
 ;   DROP INDEX product_setup.product_locations_product_id_idx;
       product_setup            postgres    false    241            �           1259    91796 3   product_master_inventory_type_brand_category_id_idx    INDEX     �   CREATE INDEX product_master_inventory_type_brand_category_id_idx ON product_setup.product_master USING btree (inventory_type_id, product_brand_id, product_category_id);
 N   DROP INDEX product_setup.product_master_inventory_type_brand_category_id_idx;
       product_setup            postgres    false    238    238    238                       1259    91949    product_price_product_id_idx    INDEX     c   CREATE INDEX product_price_product_id_idx ON product_setup.product_price USING btree (product_id);
 7   DROP INDEX product_setup.product_price_product_id_idx;
       product_setup            postgres    false    245            #           1259    92268 $   product_reorder_level_product_id_idx    INDEX     s   CREATE INDEX product_reorder_level_product_id_idx ON product_setup.product_reorder_level USING btree (product_id);
 ?   DROP INDEX product_setup.product_reorder_level_product_id_idx;
       product_setup            postgres    false    252            	           1259    91884 )   product_reorder_point_tool_product_id_idx    INDEX     }   CREATE INDEX product_reorder_point_tool_product_id_idx ON product_setup.product_reorder_point_tool USING btree (product_id);
 D   DROP INDEX product_setup.product_reorder_point_tool_product_id_idx;
       product_setup            postgres    false    242                        1259    91808    product_uom_product_id_idx    INDEX     _   CREATE INDEX product_uom_product_id_idx ON product_setup.product_uom USING btree (product_id);
 5   DROP INDEX product_setup.product_uom_product_id_idx;
       product_setup            postgres    false    239            E           2606    92535 '   users_roles fk2o0jvgh89lemvvo17cbqvdxaa    FK CONSTRAINT     �   ALTER TABLE ONLY user_creation_authentication.users_roles
    ADD CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa FOREIGN KEY (user_id) REFERENCES user_creation_authentication.users(id);
 g   ALTER TABLE ONLY user_creation_authentication.users_roles DROP CONSTRAINT fk2o0jvgh89lemvvo17cbqvdxaa;
       user_creation_authentication          postgres    false    254    3373    255            F           2606    92729 0   password_reset_token fk83nsrttkwkb6ym0anu051mtxn    FK CONSTRAINT     �   ALTER TABLE ONLY user_creation_authentication.password_reset_token
    ADD CONSTRAINT fk83nsrttkwkb6ym0anu051mtxn FOREIGN KEY (user_id) REFERENCES user_creation_authentication.users(id);
 p   ALTER TABLE ONLY user_creation_authentication.password_reset_token DROP CONSTRAINT fk83nsrttkwkb6ym0anu051mtxn;
       user_creation_authentication          postgres    false    260    254    3373            D           2606    92530 '   users_roles fkfivrl5i32jkvd1w39y4h2vn90    FK CONSTRAINT     �   ALTER TABLE ONLY user_creation_authentication.users_roles
    ADD CONSTRAINT fkfivrl5i32jkvd1w39y4h2vn90 FOREIGN KEY (role_id) REFERENCES user_creation_authentication.user_roles(id);
 g   ALTER TABLE ONLY user_creation_authentication.users_roles DROP CONSTRAINT fkfivrl5i32jkvd1w39y4h2vn90;
       user_creation_authentication          postgres    false    253    255    3369            �   m  x���Kj�0�q��l@�}�$Y��
2��)�dк����
�X�x"q�F�`FE����B,q٥�0���˕Nd�dR�ޓ2�@�,N�H�&�5�>�����0��v,���:q_	8tF���h�����4����.������D��u.�|΍d�3�{�G%�i=�ht�����@���<߯vW?��Ʈ��XUlE���v�:k͞G|j[���p�c�������?�[q/}4	�M�hsv��Y��>i؎�6�j`��c}nEm�f�s���~�D��#���S��/x��iEm�f�s��7��m@�^�i����`�K���`�5 7��e�����/^[���<=�7°��      �      x������ � �      �      x������ � �      �   3  x�ݗ�n�F�ϭ��=i�����KÉ ���Wibi$�p,�O��l��H3�`$�p���l���_Eo�IA �I	�X��&�	#�6W�>M�]MRaѺZ�\j��*1se��W��F@f�~6�������k���g�(�� T�ԝ0�3�}9�sIw�����<��V�{ �+�gų��
{H���o���E�P��T����
�p��	t�)X�c`����2�T�R7Z"W�yъ��.C�\d}����E<��<�|=�4������GN����쏫����b?�^6���(��-.�e���oe�(�6'寳p5e(�^�<|�]��]�\���� =�T
�\
� ��j�oή�W�ҷ�g777��x�qP�N�l�w
� ز�t)'�ȃN�+�GoJ�3�K!��]��7�$��\v�v�aN��gy�HȬ4�;m�I��r�Rv�Av6�Z\��{��-�i�ϛi�,�d=��ɀp{f�os�Q��@��˕ZD���B��Lߜ]��E��.7��p�; SR��	P.��WwYnBM�,i�qȭ �ɠ�MxF�������6�����e���u}ɻ�9�'�g�n^fn;=c�`�7�;);������S��
�3�f�q��ɷ2���Kg�0���j@��jm���������D��'�y�R��|r}M#n�a����&x{�"�==�ߑ��IB;���l���-^��[(z%)�4��_�8(���J)}�V�	�J���Z�e�� ���~�"x�:�]B\U�ɑApm,4i��=�c9E(4�y�Nr�<�<�dnm2���4\��`$�W�2��Nb�)��3c��Jv(Z��0x���)
	&g����(A��F+��:��֔Hc�p>YMo)���P�E�+C� ������b�a�v�wGdb+�[��1�Qa�����X����8�ҿ�����ep����rɽ�(t�T<�a4�4�\�*3�6�\�Jé��w�,�ǫ�^�*|�r�R�X
MYLRv�B��l��h3�J��u��<�K\��%E��x��cJ`C�>�^�4q��h�sY�1#4�0X��d�N��܋ �v�I�ͷ�E��QO��A2z$��Lk�@'��I� ]'E�EE$�k��5��΄�T��Bɪ��k1��EΩ�t$�[6rŦ�l!S���n�����l�t8��e�]�oG�2k�o�!6�ѫ�h��x�6��Q��`(ȘW�4�# �j!��`؎�������ڣ�S������E��U��+�[t�َa����΁Kdm&Fn�%Z�SQT��T���R����>�쿜���u��1������-iC�3(i��iY      �   �   x�őMJA��է�i��oz)���'�M��d@z@[�o��х
B�Aȃ��Dj�{v��	�4CQ_�*l��u6�����c$���#J�*e�_�NǪ�e{>��Wr�����Djf�R_R�^?�`���hc�,NRL?�3-^f?�)|�ئ�Qy=�Ѿ�#�XC(��Q���ҝ���6N%4;���i���+� Ή�	���y�����n�y���:��4�_�Ȭ      �   _   x����� F�3L�%+��!����� �u o��=h�nj�L21���ub���~I�����*x)�_H  (AƖu[k���c3)�x,1�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x���Kj1D��S���c�R"'��?�0����'af/��R	��k�Z�C$�P�V@R�eH��܅� b���4W�d�������ޖ�8���<�����M�##`��.y'ْ�\������bm��D!����wT̓?������L~��c@���;�%�����p�B_U��Z      �     x��1n�0Eg�� �")ɇ�	�PdhP���k��Rd��n���� r�IU,F@�$q9{ɑ5��:���k���&K��)���I�5�Ī�<h3�Y!5�+�R�ͥ[���z>?��6\�oz��~.�yx�ڲ>-<���$y9�ڡC.�w�w��y� ,؝޶�Yam%*�B��Cl�8���}�}������<x�'�cH	����o�Ǎe�-��l	(*5������X,���c ��~��m�e����	i$L��#3~��Oc��_�zg�      �   �  x��ӹn1 �z���������(�.X�%cm#��ql)6�a��!�7�	�in
>� �c�s��f��a{���x>�����q�9�,���I3CQ��z�&P�L��):|�O������m�������G�(I'� �ގPGCQ\d�Ț�ּfWm���H���s��o�jq��T.�w�:�<cM�Bm�{���9��e[HLK҆���i�t�r|�M���7�.��d��[o.�bBD�ĪU��v񉅪,�<z��#�/A�Qh�/�������~U�G�_�d��]���ۚw0��U���"lj��@Vl������
��$��:���K�Ľ��*��zr�C=gȁJ��{����K:�f]�_��Ϸ�����L���~H���#��WV�O�W���R����������G�������v�z�Ʌ��눇��0m6�_\�q       �   �  x���=o�F�k�W�L

��LR�|9\�k�s^��k����5\�C"�I�Hzޗ|���� p��*+�J2�H�Qc��rl�v�.����i���t�	(�([L��$�T�gL�Ò�E�TL{c/בB��r��B�n�� ��]K�lB@��F��2�*�`��������g2?.��
��rs)�������2�怛��e!B�[��PB�,��:TNRz,9�H�K��������ƴĜ1�n!E����3w��"+��pZ�*�X���u�s�d]b�������V���N<������NF�1�x:^����x�L���m�q���²�,w�%m0��τ�ۀ��(�y�2��}�}�C�7�.f�[8$�y�e�;���e�F���ȚX���8��^�W�Q�U��DK�y�jO:804N�/U�Jn܈I���F�"{E.�5^�$��SGÎ��+p�[.��?���z���?<>�x�h�c�U9�1M�ǻ���vN�<�膕��ѭ���������p:N?٥����;Ӊ��9��1J���ޕ�fOg�M_�!y���hM�����t������������u?[v0g�B	XL!���B_��N;�Y�vz��:�2��zO9��-�������<�8      �   �  x��ώ�6�Ϟ���AR�(��s� �-H�b3y�rڝl�E�.v��[�DZ���Lf��焢�@$'hb����E���������m��q� �d��JF,�f�9ҖJ#B��@4�7�=�)�l��[@_�O��� � P�R�i���6�L��b�"�gh��)Y�R�������cE���ݠ%"�eZ�n�_?]nٿ�]�y���큑�L���G�ClgDy�j�s���]Jq�SY�'-��b�����0�
����VmH�MJ8��jQ�R8��ת}y][��&�#���U�����ꁴ+�vg��� �!Hr$����{�$N����ҭ�^0����0�A���Y$��{I$�oF�J/�׈z�LP�t����o"<�}�˼;�[��I�r`��E#yV�i����\���#~4�R��ͫ`���X����y�%���<�*@x&�\v$S+��_�:�ߨ�V*$m�(��5A�كy����o����ި��pЁ�=T�'1��i�_�	�
�l`ٽ�a�_�x:B�O���Н��ҝ����o��Ǒ�k����.b0F���׆��*�n���ǿ�|�v��9t�rh8�pN�$�喪g�]���:�:GC���'���;�;�`���29ѕ�rz$��!cs����t���      �   �   x���;�@D��)��#۱�]�	����P*N�J=�'�4��i���;0�
�F�zBp�	K�f���z��O��:��[=U����/2y���Ri�-I`dT�t!�� �F�K�n��z��)C�� e��jEE�3��ŀ��l��
�<M��L6      �      x��zǲ�J����WԜ>�V�Y��`5A%Z$��9�T�����˝�!���X�|��]�%	�##��S�*ͱ0�AtN�x�п�Ų�ȯ�o�:�C���$��3��`t���4��Pt�! !���c�qB �?`��0�;���q�d��6��q�w�F��M_����4E	-�TQ�?�N~���@��Q�Y��h�λUU�_��pv����_�D����~>��P����'k�{�'eNC��d)�?j�1�z���z��*�+�+�{��}Eϙ=B��~C[$�M���-��E��FIa�}��ϲ�3N���*(�a���=u���xK�ׯ�;�Bb�Y��e�8ȧ��j��@�f���j��u����ī���ݢŽ����Z�� �;1c��L��\��B��tЈ����G�G��=|(r�Z�J�s��B˭Ц���B�{,å�s�y���E��E���Ƶ���ּN��N����N�a��y�O�~�4XiJJ7�c�����vo:ʘK�a�Ԟ�9�٭��_�i�-�ޯK��K��5|Ea�>�?���Po��{���i�\�Q��yh�r-��<���nH$���g�?b�E��hUeϺ��g��^�j�� Z�+(�^�z�[v���6)�(��?����8Wk*�1������~�����Ϝ;E�+B|'�������O�����#�)F*虫G�2���6�RI���2��N�k�*��P���;�3�����#]k̘���!՞q�7~��~�9p�������j�~]p�J�s��y��/�xX7���=?q��mX��i�޼���Ƣ�
�ִ��F��M�jdT���j�?�����׻?ٛ��^����&�ɷ*���=}����g�'V�s�ND��y��씅'���V����f[��$�����go�ǿ��I<q�sQx��W�����j�=y?����)��E��ŏ���/��"L�;�j|�j-X{0�O{��7y w�`�a�����g��h^�h�3�Ty޲>�����o���������:�TZ-�?פ�������,�Gz�-���c���y��X&
M���,��On�j4G���\ur<��&!H�;�L�y���r	���7Ү�J�qМW��/�6��.WgC�;6�SA�X1��*�}�F*�D_V,�hmƯ¬�cD⋱����s�D��?1¾�z$N,D��*�&d$ ����'/��e�x��ŀ��V�}G�
�	���]�P|��s��-�a���gfט�.W ����2JUY'� fģ/�3�6;qPe^.̕����հ�����R'��&"����a>q�nf&1��3��\���Z.��K�ϙu�K�e7�6߬��jft�ui6��J�s)0]��s;������ϣ-�8�c���ZԖ�D�̡���2	W���i�%2Nt��b2F��o^+���y�u#o�5��&�Ji���nC��6=}6*��;���d^��F��2�'!���*ГL`#�9dEEz�[��T�d&Z�:x�,�2��Ra�8B�^lte_�鎜�r��1�=f��L�|4HT�i����fxw^:�^| M}�,�C̵���H���h�t1#H�C��IO�x�xն
�s2,����7/���D�	m��se�zR��ʠ��7x����1�Ad첣A��lml�s�}���X�H8�L�*<0+d�W��Y��V�7_���U�%C��WZ��T�(��9�Ũ�#��j�@]�5�v��#v��!u��E�K#�*�#i|�ʊ���-䈐��2u��%�M���C@;e��6���l����f`#�ܺ_�# o�S�P�%��luՅ��g�"Q�h�]�� V������H������.�U�Kr��:�OzLςZ��;��3OG!'� ���%��PX����b�d���~���О���X	*}�Џ�n��Hae@�?H��Т���TH`g�SW�##8T_p����:~�M��xcp���D�Ym`i�svze��+<R��U��I�j���	��@O�������m�Mvp��ר�G9�6d�!��v�}�?�"t�{��l �A��6��>�bK9%O��NM�o�%Kj����q��72<`��S;9J��;Lڨ�~�@��� �ĩ���.-�5W�<�2kRޜԣ%ȃ������%�{b席W%�B!N��2Ta�ˡM���Cw�8�YO1�)r5J���Ng�����1�ܻ%�f>,�Z�����65��c�ar��eXj�ϻlz��<d�m��%/?���;�Q|�q�x/�M�SF���*pPh�cB��P��v4�s�ݶZr�D#\�S��Ąv}�z~�Tʐj�Q�����X��ܭŝ�4��8_�������B�ez��B�?(�Ǣ�.@�s�����N�÷b�N���dxje(Mv�;I�T�rq�͔�������[3,z^��d�S��"L���Q��ށO�ݩ�j��d�$�I�����x��,o�[���z���=���+K,	!���w$�&-�
�=�W\��H?fR\�~�C��d� H�u.�yF&��
O���eP��S��Z���ԕ؋9d#��Q2V�3́)>%��ɸiǳI?`!�i��XM\{���fgJ<�{�oו���!�Z�t�L��t��w���3�� �-M��Ň+�)&�읶ʧ�,�_�+����	�C�E=�4+?e�;�Xl��]��n^S����X<�����i�l��Ԗ��V�����s��,�����k����xd��$[3csH�@bU��H��{}��� �_}d��|��c}�3����_��+�੬`6�0��Q���!Zk��t�z�S��(d���DS�����ց���K�J�ƑP������Zor{�4�[�ei�ە��o���zT�c��p�v~_�h��7��|^W��{]������� �נ����+O�RpS�&�ə�+�%����n��Kr'�f�}��zm�=c����#t��@�] ��(@Hv�r��3p��`�m�����C��(�|���Ԇy��x!�� ����$q-�n��������X�|B��=}(�7Ο��?�ׁ�_�^=�S�+u$bwl:���.J�?q�+Sa��?6'u�9`���}9!~� ���|�#��6�����,�H��k��k�<E.�&j�$i�*O]�mp����0�ɑ�%���*,T{� �y�g�8�.��f_��Q_��Z�Yk��(�F��	��U�a�{�o���r�M����_]QBoG���n��+��U������"�!�z3��B&|��$A�$k0�㪽o���ʀ6u���\?��|�]��>Ufp{s�I��M,�����?m|xπ��7�v�]�بH���n�e�-�^��B�����B� ��)8���T�gp�	%cpʥ%���y���D10R�1�O����؉YתW�6�g��=�{蝷G�_8!�B9���[����M����lPbEVF��嫁��ڱ��'�>��p'1��?���̅B���[u�I�5V��;���6��ew)Қ_�����{5��X�_�j@Z�Z}
3���S��0:��i}���1a�k��O��1(�h��U�-��"������'�~��R"�q�e�!���``0U<.��SD�_���ki4aa��,:���[ 5{r�I^^o�XV�rA΢a�x�H��j�-�v�-��q�I�xӊ�oI���U̅uR�oX�K����x��ڈ&\'��lU�es�Z��rt@0��:�CF�,7��2����-.2EZp�j�Dw��c��1�f�CZ<���Wb�����������?]�Hj.@<�-$w�G{ߵ���Idf���U��f�����������A�3 O&:�o������Q��H�y�n:��?����qehZ�:�	>���aP��
�E/�����$�0��,���Om�<ڡ��ͪ�[C���S8e9�0����ҍ�Н�˼A?�W�I~0��"�� ��� �  }�� ����+�{�5�*�n�ܓz `��@�<g��N5:�;n�#d�60#Bq��ѡ��'�m�^�F/6o�����ŗ�pQ}I���@؟�C����u_E���`�\d�(����c�IԴ>[��ƽ��j��nJ"�~�Lm٦������GF8so0jT|fy¾�,�է����� i�5놱�`6�pyx��%+��e���x}��D�i�F�VNl&�����٦:����f��yC��B���:�(а�QP�)�����d�s��o�?�0A�p��o�y3�2�a	�zB�b�+<�2�L87QҤZ��v�VU���������[�4���"��t���u����z�����ܮ[Wi�����Y�+����Y�h��-0l{7me4o|�>��|bN�}���
�ܷ��lB�Vo���'�F]��ͫ��gD�n�9�ӀkG�I;�_�<��4J��p�����8O���|�W�.lP��q��`����3���q��WZT[�fΘ<�}���K��%"��GO�����J@b�1*��İ(o|��'�Ĵ+uf;V�@՚���M��{�<���A6��y
��@�j� Fk��V����S�>�BIe^���w:��!�e̚-�b��+��QM��DJ�*:��MO�L�t�?��}D�`�l�tѧ��bU����1�(>��4�����	�fNH?!0v���{E"'^X�̤�Y�q�팽9`7\r�F�AQ'��ν�3�M֦s��9/��<�)��
�;
�`x�!��>9��H�	��4�͟\��%�Wc�a�1���F�ả����ǯ�r��	�E}�S^X�M o�Z�����T��43����9�*���(�eʴ���o*�ܿ.���N���̐vsI�Q�74m�V���!���A!k�c�^%�EV�Q;�h�jR�|O���h�&�z�t�4(O�n��q��p�ho)�۲���چ�v�z@i��a�^tYg��z��e�2㣅�r��;��"*y\'2�J��٠\�O��)���ݝ��	� ����wm�P
��}bQ�/aGh�Y
�ҙ�>�eZܮ�o���Y��;�י��=Y���ְR�#�|2Vvă��&h�Y�����$&}W�/�}����՘�JU��E�����.�Ո��(?��<ܙ��CR�d8K��+���O�x�<��q�I�V��{�`.��T�mI�"t�|��j�H�ȕ!
����}���_��k�a��|�����pk-��`���/��J�w�o��"�]y������E��pݛ��9��s���9��^|��S?��y��q�xk��=��h�����5M�E��J�-��h�>���k��$ո�W'_� hJ^e-a�PJi=#��n2D\�B:w��'�.B�pk�#��G;%[�ty����TḰ(�	k0�7�{�؉�ҧ�7+�piS";�4��K�Ò|��J�Ĥ�!I$���b��[Nz��s>X3O��N����KJ� �E�xr~�1b"��V�z@ З%�"��qyF�� ]�\��3��:���Z�+B�@�J|� uж�s�^f���a�Uy�8e���k�=���ڝ���Y����,�x��y5���Jː%7~S�R���"s��I3,z������7�IǠh`�pl��֬S@o�{u��~:�NI�E" �x�7�f�L$��u�hsA-u�6¹�J�ɀl�}�t&�>�V�"�u��_c�4��Ch�j؋�W�~$ý�~@d��E�H�J�Φ�9��3�;f���Ļz�U�DF��c{N��֤oN �6�C�L�{�|ΕG�r����F_O#�sٙ�Nq=]gU���ӭ�т~Ƿ[h�	�>��e�`�oT0�%�� �^�gC�v��t����M���}��R��bTV�O�� ���GeF�=��[�,������  ��`�i����}��������w���N�����_��_e���      �   �  x�����1�뙧�� ْlM�kR%E i����7{���\I��#0H�>�hJ%�| Φ�;�\+�ئ��~==�/m�-#��r�n�����ZWpMGJ���C����c�:T YH66���g�{���(چa#^E�0�H�[�J��� '$��ڠ&uY�������.���pq!��o�V烚@��S�(�r��L:�#�h)��q������zڟ���=s ��&���L�Q]E)�S a�CF�eD�b�PT���{����12���݈��dd>�R�H7&�L	�QΡ'n6�H��|~��C%2��&�
��C%7�����	d���z��}�tI{y����K�6�����2��0�����+s�s2�$̪AA����5��sKu����K�V����� _��j�9��y�9��D      �   M  x��Wˎ#�<7�b~ �UY��O�Y:�^��E�zd������^�^R	��3��!0@7;"�"#�3�{n4%2Iu���NE]��M{�����?�:���i��^e������ɬ���[Z��?����<�}����hvit�-�Lu�ICr�[k�-�yG.�/w��>�YV'����������!��P%	�P�H�-��2��x���Ò\�cr�(����T:��\��"�	����O�yvyܞ�}�b�;Y�%y7QGw�QH7�J��j(((7��&�hI��i�6��)�$�r(Z�����f&�x�i�>�ZRI.ߚ�Z�J�͌��h��\��L�_N�K헻w���o[w�����E<�[���kau%>��v��ޅU!1;�)1�ƍ7�DZb����RR�2��v���/���պ��o�46����o5����j��WQ��.z��IǄR��H�fj(5��cMq�����������<Q��5K��<[O�kR���"��f�R9)l��Xs�ς�X��͛��єMh�.��l)�W�Ev��ؽ�����ZG&v���m��|[���=,y�<����f���)������*/O��3B��U�k�%z/��$��Fa�uԆ����ե�ty�ww���^N/����ր�ƫ3d�6<E���&��v�S�C�,�?�п������"��.����"5�'wO~���T)�Ůp'����W�?|��_^���Q)h���fޏI�x#1DeŔ���!�e���/
��!���7��!�41V>Ô[hT�e�&a�;_�f��������e��V�E�^�C���$
3�_�nSKd��5]�����x���P���{o���#�
�s�`?��k�s�{��Q׵�)����SGA�a;)��9ktA�<~ys�?�VǞo��9\���A^���	���0���Z�Mo/��ECL.��R�e@���%�2�;�<5a��$~c��q1�0F�V#N*N��CAy[NB��!�ί�n�&�5O�Ի��4(_q��*��'t���s�Gp8^p(�B�Pi�VT�Rwq�^s�~���X��[J/�SK^��E�ΊF:��xb6�I�%(D�ҕ�E���}X"�NDT/���H3� ?��p|�:f��@��Cì�@�Ԅ<5E�a�4x�6�1�nnw�ս��u�`��^��+؍�O�,�}�	ae���]aL�W�c=v{i����h8�<�$�
�.kl�}��.q��� ��z~-
�JH�It��`��(��m���1�	4�yy�M��:��~�>����`GR��m(���2���ȵ���뷯���X�����u���
�+�      �   �   x���1n1k�+�H���{D^�F�� M
����9N�2�b��v1X�K�D&1[�P�Tm�jcl�n�ae�����G��:F�z{uHb����,�����{�d_�y�����y������R�I��PO,F�+1 2��r���}�t�'�C���x�X(�(n�7L�W"���'-IT��%7���<1*`�Bk�F�b2w����}�t^g���g��eY> D|�      �   �   x��ϱj1���y�-��=D��Y,�.�С��'
�2U4�}��;;�!
L���Np.��3��9���u���J���H� ���,1�nc�����
������^0bD�TO$[�-�*R#�p�8zQ�5q��vr��,΄��!�?sٸn�֒����SIc�j�l�PE|t�m�~�?�{sx���Z;�C�`�4P���FT�!}�^��S)@r��Q�X�Z9�y^�e����]      �   �   x���;n�0Dk�{���u��`�&�4)�.�=}dӤ
��b@>
F����b�.����uS��5�Ώ���t���B�p?��jB0:���������*�IClW2�*��2g��9"����ea�>xZI�?J���5*kQ���_�7
K߹��f�`����LbE�#�~;��ˀ�B�hk�k!3�G_�uY�/�uY      �      x������ � �      �   �  x��A�1E�ݧ���8Nb�5��Ɖ����'LCר�b$$�J���Uy�)��B��q �Ġ�2�����:N�7�@r�����̤&���DFqFG�Z��$潻p8]�/>�?�^jo#B�8/P;:4���tk*/^��w���� ����4�av������f�n�4*�T�Ø�Ջ�����D+�EP���1���̮1.��]�����?^^�gŌE�Ku"
�� ��Vo��;������Қx)�����p���S����b��!z�{�9��sWSՠ�Ε�_ț	�7A�������̒E|tni��W�N֬t���Q�Hq�0��k`4�8[��KKr=f�������r�-�o���&�i��EgI�ޱ��ʴd����4�bzU��r>�����      �   �   x�]�1�0E����#�I��k���i�@����S	�t�O�-��(֌ a݇[����f��b���u{\��s�Ѻ��S�[�T�@�2��	J��A�))�cd�y¸�,q%�s^�Hȝ?}�{��_�����1�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�����1C�qi`�3��[K.�z]A��>�B�E����!9���n�PHK(jex��:F�޳�J�Er�����Y~a���a_ID��Eq%��]�b}��?�'��S�̳/�R|����D�C�6�ۺ��W��[�p�B߲Z�      �   �   x���I
1E��)�@��Ԑ���&S�m�o�;A7o��m�I�}�0�5h�1�T6�͸�1�Ѵ(t�s�FJ��H�}��/���'��30H�E-d)_��]qD��&ô��P!��Ƞ��*a�̟}9R��y!,��{���O�      �   �   x��NI
1<O^�:��N2o��I&�Ń��8 ��*j����3tD����&��uJ�lq�QU6@�
�Go�`�I��3=�����02<���+嘒|�1"�aٳ_˞ǮaQ�6��*A��@���s�����F��W8�c�+�[�      �   �   x���K�0��)��+;��ga�� D��T��b�4��C�������L���gS�--�Mjr�V���<��b�{��(g$:���_���ϳ׹� ����Mh0�4�
��n�)KU�ܘ��b�o�ŕ���E6�5Q	�5��6oVJ      �      x������ � �      �      x������ � �      �      x������ � �      �   n   x��˻�0E�X��ֳO��ʵ�Ȗ̐��"�D�$�VHW�c'��M�ĺ���u�p(���c#E�1�̫v�]$.LT���V����~����H�����s�ua.&      �   ~   x���1�0@�99pe�v��,,i� *����#��<�j���s�c��h`��PMy�@�&���B+��n��HS²3��	�#�z"�)פ��_�jZC	���s>��%�o��M�G�y</1�7B8j      �      x��]�r9�|&?f��2/82��鞵��ٿ_�@V�H��&YEu�Z�+	�@�#0����i���}�g\����������McL�>;c�O{v)���մ���E�i������{����kr��miO�C*��J��nnW'��Fa�+�ŕ(��1��+73���O�������1)clDM�੨J��X�$u�x��K�k#5|���]�Z�p�3��L�����t��慻�\���"%�#��v��,��ߐ���T�GR�Iu��c|�G�-�����H%�'�q%|�Q�ӽ�]ޛڰ�mѣ�G��OM��z�֘��w��m(�T�v�Æ�Y�B��h��[(4lqX��0{�Qacÿ=]��@i�w�ó���s�m�ɳ;�M�pʠT����^@m�O�d�!�r�y�,[�7���MYo��;+��S�2��(�ş��	ɢ���x���.�[�w��]H�<~w�zi9�7�����%_�=��c�ƭXcC�����b#�s�/�[Ρ|�4���0��׌t��=���fԞ�����>��c���Ѻ稜d�Y���Ј3���%/Ϩ�������u�D�a��j��z6|��!h[�HJX�>�3��ͳER��r����q1�x*9�XQ���ӄ��:Y�hQ����>�đ&�R���T����N4x��N�ǌ�}��Cj�W��Ć��|��<���h�=XW��b��]13"����g�~B*�_j1�ܚ9�Z��e�����_���~��z.$J���&ϛ��6��+�4Q��vN�h���?ڑ,ڗ�+�v�Тa�9\��1��:�a���0�(�s��}���*������:��vI��/����[�?#�ߡ��ay]��_fۇ�;S�e���d��qI�G�q�g�6�߳Я޸:�#��a�f����0q��Ƣ=�P��'1U���D�Q_# ���>S���0.���c~����sы�2�O�"��7���.�Ekq�Z%����i�^{11�,5K����y�z[�/0��g{�dm��6�3���#��j�,iL�m�s�v�ļf�]���#l/���3�u2<YK���A�-K�"�//M,Z��`��wѬ���֚�`�90߼�����8�1�cݠ0����9!4'e�kR�rFA���ط���f��XI0�&Q3�v�(!s��]6�)����u���O�s-`��Z��YWc-�X'ꧥ�`�PS��I-P������F�40۹2�^U4��<U4�ý����c��MC�I��Sp�����C}ٞs�LZJX�<�-�.��I3QK�|�I��5���~�:��jPjUH�PCE�O"�i���yh �.�`�v���@��y�-X�k�c3�R�
��\���ͤ��2�S6uny�j�Gw������߷���������i��_����j{{�S�oe���{��������-o���OL6Xᖫ��^4�]4�a'So���Vl�����D_�������/�XQXj�j뤞�w�sy���_{��`�h�=���џXO���d��Zm���[s%o��`ə�߽x[��q�����f�K�߻:IiY�^�<Jy�����Ye�����Dy��!k����!k��c�b�.��q����qͩ�f/���pa�g��T��z�{.�N���l��~[�כ|x]g�7�p~�t��#�4���c���¨�?C��c|~q��y]�.����e�~���Ō�J��,�~�3p%�a����9,�C�}�N������?�<��f�e}kv��҅��?{��ޑ�k��]Fs\m==c[���h���+˃v|n]Y���,�c�_o�����Ǹi�$;����k�����Xqb��'mLX���j�k=�z��~����G�d�%~.)��W=�>�C�����-_s+cnKI(�;+o�ۭQ�[��eGkv�}�=Қ�Z�{��a��e����Y��=_���Qv�+�����dg}�/�u�A�l�o�2��W[׮ׇzڧQVo׃�O{�����p��%=��)��53+N����:���o�5��N!<��\������]��v������_q%-���l��d��'s�u6�J�l	w���X�N%X�fϻ��rj-(#�\�����Q��xxߏ�?��N��ex��(�K�(]�ӫ;_}n�}й�}{��q����?�と ��5���j���◟Oc \����b�{����}l�|�oϿ���{6�CwB&�����B��:]9��(�:�ӵ��Oh�O٠��q����7?Ю��d�����[�M��B�r��>��wΩ]���w���{�-�1[��D���Z�b�ö�^R�Y��Ⱦ�D����f+��h����E�h�d�v!��C/bb�$��o�Ỵ�^|ޏW���ew���h���Ϡ�_�������A�}8���Y�SY�-w�[��~���_��v�<}%V��"<���1~�n�"s)l��lA��z��QPj��qG#�@�K"���_V�y�o�	��*�|&�P�7@�aH�J�C?��$	��*q�I�Xtl	��B5cƢ�
,����$8��ʽ����3�ʵvE��� 4�z[i�o��_������`o͆&��AZ��w��<�'-	h��!<"+�g�6C�Ec�Ϙ�,��N�*�{;�WE��塦��D�p��� �qa����O�^^�4�;h#�f0�dν��.S���C��.Mk���zw�`^AtH�AYT����_��E��V4[�lE��V4[�lE�;:��H��D+]�lE���يf+��Y�l���X#pe�O�wp�섧 ;���-P�Q+7w��Kʁ;=[1nR��$.�_�\����u㮧>�6Fܡ��:*w���b��6RKi�S�(
\�8`��چ߷n�V4[��A��Fc�LA��l+t�B������Upm=9/� ����n��7E��6z�f��f�>�]����3V�%�7�	��S!�K�ta�&�5#������$2�X�.��`"����bK��	KA�Eb��m�\1�Qb�{�嵥ˍ^�!2�b9Kf�}6�Ɍ�����	KZգ�iN�2�G���5��
�?��bǳ�݌���>v����� ��E�ۊ妼���=�� �Y��� �ۻM�(�ڄce��)��Ox�� �b���4��<��l,LbS�����c}	��t��)�C=oŸo���q{FlCMY�M�������H0���&+���N.�=��:�&j3�����{|�Q����ɪa�1^$���҃���D�P�ԻVrb@{�9�/�A{��M\z��>ʹ�XF�3������\��!��X��=E���N��~��U�3���tބM���|�}�ɠ*,2��H�:�i[5ʲ;�Cё����Ű��Q1 �����s-��l���a�V�f���STcg�[�n��V�����b����`�u��+�ŷ��~
W(D��{@��'��Ëy�9��R����W �-��x3@��! �k���J¿l�=������x�$�t<}���O#Ɯ��KH�۾/@�'If_��	A����+�r_���5V�������3x��e�[b�7���w�J�M�mn\�1[-���lJ�.��| ՘ַ��t��Ǳ7`~��a
�}7���Ex#-��
������]Mn�}�j*�ہ��WP\A���-��v��ř�ܭ0oB�-$a9w�-���o�==�d������ns���
��.(��y���`��y���TYiny]���{X�-��)��o���g���� �)��0<	͖��[!�K�U^Q�����L�]%Pr
ؿ-����S�q�I�g	g�g#�W`c#H$��s�*����-�ŷM��uN@���Ӟ��:A:�y��Y"� �������"�mo�)�9A���Ο���hZx�D=�:)%��[RFeJ��~ڎ4��OQ�W ���Vx��|����~:@_<	�    �Q��f�`��Q����Y�ΝZL��E�}`S�)G\a1$v&����;�g��"�Ŕ41uw�������q{�����*ꫨ�O����=��]yE/_�^~���ݴ�
�ܿ�<v|�C7���������@�7�YK�+������K�l�ˠD�:D��Fd�!�_��cD��W*"�=��v��H�ॱ�u��̮����_�+�l����u}}�ï@Z�2L�  ��E��r(\�L�䖓)�����x�y�X���/�t&i��2���w�������]��<��#���G�7�Մ����~�����\1yl�r���=h:m�Zk�� dAV-�cz
�R��J�$�8����6ǁ�D[=��C��џ�,o��B(�bQ����t�/���Xd;0Ǖ��	F�K���(i+�%P-��H}��f�q�u�s�rx�)1ʋÏ�O�m�ß��P~��ώ�|LU�W��t��HV[% �J �`��1�P�.\҉�#]8�#rb��m$K@�#��:6��e��N���}~G��#,���\=��LL�x*�М�R³�Y����#�q��0��I�_Bq��r������}�Pb�Q����gI%��ß�Dq�L��t؅�$8�:��1�u���%f�&�����r��:�y���4�����0�)�(x��U�a�Tʒ��06Z�K*�({�L������b�4y<=,U�>�$R�p�o�ù�D�����m��"��Cg����6�P�,�V|X�aŇ|���;�#������ؚ��#��p��G�5��Õ�'k��S]���U�_{�Bb�e&��܁FqP��'y�x΃�1V��X�
n�<���	���1����00�P�ϯw�e��˦�Qs���Y�~��v��>P���r�-o��(��]1fŘc���3%���JK���~I:�y��K</�Yۅ6�hJ|�*"��G6�i��)�|�sy�x�ob�DH2d@��H�͌Y H����n���̓G�!)�����S/ϓc�� ���]�
�>o�q�刓]�w�;ۑ�y
v{`�a��bK<�$�m磓�wK��2�D�l�+�ѐq��Փ��>%�3����ή��#�1�w	�n6���On�b��(���`�]/��X�>���k�'�%qO��#V�I%� �vƲ��}���Q�;E��؈tx�� ^@�3�U&ǅ�����&5��[S8�e}��>�4B�tHuO�ba�&���K��RRkѳ+���� �ǅ�����L}#�͇~�k㤗���Ȣ���f�$\ՙl��q�=pGy���<p�<r����ƉFF���<&�J#�U����I�Ҷѹ�dM�=�����o�������?�埿����_z���
h+����Ohk�j��V@���V��H��%�$�Gp������;��/�G!o=��� nn+Klt��ݸ1��,�wl��N����k,������z�����Lz	F��.���v�(0�]A�jk��#�+�岏`���lۄ	qo	��L��<C	b�-~� ����B�
��LJk�=�C�%8��cY!�܈��[9�g<��r��P�7�އ����B�7������)ܸʱdQ���lx@�9�Ȓҕ�A�#�� )�3�=B����s��8��D���$�3��~�� �xN-PZUN��%�4ύ��ʹ�+������v�=x��z��)E7e;%U�=ι�>�k��
�_�T��8G�?�������Z=�2\,�1\�����2�eZ�'n�lG���ў�R.W�-@{����1v/��q2�<+,�9a�Jw��|T��;ð������z��|-�e�� �1�+ɖI�y� ��	Ml�	�=����F�vH��Ã9�:�(��r�<�n��{2\P��6j����57�o.������?�0��z�_~k�*H� ���
b�X�bkVl͊�Y�i��Ԍ����c{f�+����KaS͕}���
��re�����>}i՘ɵz�/{9V�%�z1sO���Ӻg����i��ΘO`�=?R��n��̦۟(9�$���I�^�Ls�'�9��~��)�R]�?<	q1�%�$�C�rR`�((�y��M/9(=��D������D��������W\���w/����i�i�y�~���DBx����|����f�o<}�޳�Q>��C�OH"y)?֡�K��ȼ��5e�Z�(F�`��Ɠ����v�g͋uڲQ�r��m>pde��jR�d����NxO�m�ku�m����h�,*�Cx۶��������K)m��N���c�f����J�P��R-n�j�4�2�i�%�U��a&R-�:f ���5@��E��xD*s����Z�M�J�P���W�5NQ��Q��I{�:%��^B�̞`v]�����~��^�+3��d`������#�����T��#�s��96�$�=�N_�M!��e�5���$Uf@�V�Z�Z��B(��]�?��J��[(�������� lz��<�yy�x�3�1c�W�gG�|�/�V�	����V�J�P��R-�ja�j�T�Z�Z(�B���~)�B�F������?�j�T�Z(����w������Y72f��7,���Z���>�e j��n���$�T�Z(��V����c�'�?P)X�=#ǣd��e�������I�<I�,��[S-���J�P�����j�2Q_i_�e,8��<%��M<x�|�w9�c��&G���U��_u=�<��==
�d���F=��8���\Q�u����t��s�x��Y�����B��F�X��w�j��s��T�h����P;��D�(��!ܜ��,G�A#C�D�ӰEة\�"���Ox�F�I�J�P��R-�ja�j�T�Z�Z(�B���~)�B�F����ٶ?�j�T�Z(��T_��[���X&��i�>G�v�-�c�W<�¨	=e��n�2l�{�U�J�P�ŭP-0� 'OL"�>!���+T�8�eQx���/<Oz�����
'p�[S-Z���T�Z��q]_��hR�)��ıb�^ݸ����H�c�HxF��\�0��WF�K�����'�	�ģC�SA�u�PI�,���v��4Ҥq$]��=̔͵q3m�Q�Z(�ⶨ�c��������u��K�P.�U"�5����Q&5��~�ә��VH�V�i�$zK�a�vQ�J�P��R-�ja�j�T�Z�Z(�B���~)�B�F������?�j�T�Z(��
T�����ْi�mP:�`���c��j�p�A�g6Hٕ�h��{�Z�J�P��R-n�j!�*`xڀA��SA-D�E!CrY�&�	&�\����x�2��T�>�ٕj�T�5���"u����>'xna�`�H�,0��k�uQ����{���o�>���v�\�q����}Y�?�����UW��+dy������K��y�A�>���B��F�8��������j�1�*zrB33A�du�:|e	��C�BfV�CAmƕ�k��I�s�f��<d%g�Z(�B�J�P��Q��R-�ja�j�T�Z|���T�Z�Z���g��T��R-�j�T�kP-z��$ƒ��S�%��5x�����~�wSK���Վ�Rv��a6,L�)�B�J���E�QUHVrY$�w��G��j��̂� lE��)�� �y.�S-����T�Z��qe�E^�%L{:��Qپ�O����$�k���0�M���s�x�)�v�Z���:XxQ�$���@&ü@�֑E�o��q��Yh�kg��BU�2��T�T�ۢZ���J����U���݆���%t1�l��ҋ��%^�J��;Kp��>�L��.�fU��R-�j�T�Z�Z(�B�F�J�P��w�_J�P��Q��n~��O�Z(�B�J�����mp���P&�1j7��ή�����-��f�n���ZN[)[���6�j�T�Z�Ղ���	�'>�h�!T��w�b���Q"$Y`f|v�����T�}��(�B��k\�j1�H=�D�;�����'����hO?`���O���ǐ� �  ����=�;�<
��Жa0@�{�zaoz�������9��6C�B'��a����І�cQ��T�T�ۢZy�W�]�=��J�ȕ#ԈϼzO��q'y+��������`»��t3�<��x0�5AJ\3���T�Z(�B�J�0J�P��R-�R-�j�T��r��j�T�T���l۟J�P��R-�jq�ň�(tTu��{i\W��5��6au�8����lŠo�I.���Z(�B��C�8�B� �T�����
�V�_�.`k��J��b��7�Z�3:=@�3P-Ƈ���>�ظ�w'���ը��� �ي�U�Ֆ�nYc,��	��3H7���}
^?Ň��󇾐<��$F��J���k�5�f�b�Ӧ?���)_��]���.M�����h�S��^�>���<	'�����.{7�Ͱ|�_ϥ���^��!b�g�Ă��~�W{�+�t���1��������w�b���{<�����+K�������Nh�7�h;<�ӾI�|�.�g����X%/m��D���n�J���-̇-�X�vi.h��\0�������6O$ʆ��#t	z�҇�UKc�.��� a�B���3e;�;I$9�m�:��bG�x��^z��[�j��Y(�BYʲP���,�e�,eY(��fY��n�X(��t����q,�+%��(l�w�w�y����H⥱�.��#8_]����]?��ӯ(�����^���?�B��h�e�-NXD�s��X\�0���l�����t�:(���b����ʸf���w9�L�{�����0�J�I=F����l}�-Q��n
��=)�{�����#�
g%4��.�oK��o�@Ő&�q�sA:���M�$���"���{� ���m�8T����9�����Ȉ���#�۩�A�#t�<Xf)7D~��������'����~��N�����/��w���&ƃÕ���A���N�X>.sm��8������^�����6�{�������5��s�O�,Y�u��Nz�9z��vށ�dܗhb�|'9�����+��"�� z�O��D-�����<V���}l[��9�1�� �ݥ�0�~�ZS�U�VEZiU�U�VEZiU���V�ZY�cR4�<%ESMU4U��?"��h!/%���	_4�!L�Gw����TpUlL��r�`���]�D�d����`R=��@?$�{3��җ+ם	�[0蒖<:�u�]S�������������$�      �   �   x����n�@ ���sp$�O�rl,X�b*�!!��
�t��黗����;��L�0l$ �G^�k�?eʺ&?�$��*_�Z5%�:-��g�T�Kc�~	�D$d9�f���
��22��`ߏ��
CG��:��R4���c��
��� ǔd-����v�dˍ��r��.#����òm�i�R+z��� mS��h����܊�5����ܷ�~{[�5�:�ϳ+p�����ѵ�~��$I_���      �      x������ � �      �      x������ � �      �      x��[z�8��ǋ���m/��f�sN��$��Q�q�t'�(D�B�w��l_�[�h[���Ҷ׶�������_]�n�	�'g�,qK.&����ט".D{)�獟�}
,�$��-Z�����;���mqu�JG~�$RN����&���$>A�b����n뛤�K�f)-��XY�o���,j)|f|Ly*��ɐ>�g�Z�r�7�G��H}��ɯ֬����+)�@=�P6w-[D��n��%P�JۜpW�st�b,��o�B¿�ʊ�%y���yH)x�#�C�!����Sb����!GL%@�G�!�p�9%dY�	��d�T����dE���h�c�Rr�|�hI�����]\�~�F�w������*16٨ܸ�Y���0�|(�[�JB���7^������b;Q�ןuv܏^���t���L���+���R6a4� '���NI�r@�z�����j�6�c��RQ���;@����ݖG�h({�}����w�-�[�E�.�X��D}@N��ȫ\I����~	z�g����,�o�m)�+볪ߣ�Hj�������ֽ���9(�qc��q�/��u�P�D�j��:��i��.0�-�+�d�Sv<ۈ�3�N�}@{]�|D+��3�9���:��u����b�5�[�:���L�k�rx[6�c�/XS�(��wo����P
���&�+� �3鴃��X4�l��t֫EqjQ:Z5,�m�U�B���r��;��~h�v����oϭ��پ�u�%�F�}K:m���v������s�H?ѣoԏ��ѥa�10��(}Y/����Fض(f�>T��+���c���m�%T��}|e��ꆙ�����ڒ�+fK�B��9\�:�
��u����||�	�;��J�kY� Kᩜ߲-fs��-�KƲz��²�2oz	{�����ֽP�����Mݒ�^�9�����j{TSֿ����@�h{�����,)��ՆY)Z֞��N�G�y�6��Ĉ?���|����5��.C+I�[���Cis��Ywݗ�,���^JcA?��6.�bu���*��NA����l��p�9)X�.��Y~9���߳�ZRs�Ǫ֒Z��:�Y�{6��W����C3��$�"�[�6���u�!��uؓt�!��o�r=��ԗV������:Q;�y[���븿��1�U[p��*���.\�3>�±B�������T�V�%���*��ΐu�(��T�o���tSS�wy�S�y%����v��_K�3�HOZ���i��!�WG�fk�y[������K[�l�}��Y5�G�u���.j4ݪ����ea���+;{O-pQ�v�*�>�o7ןަ��͢5�V3l�O���a���cE���G��=���#u>�@6X�\�y+-�T���N��8��3�M�Ԯ�Qo�qA�k	�����f̢�{m��**�6[�ܰ�����h>돡{Q�dw�bN�����˘ǖ�����,�je��ú��z^���u�{�m��������[�=���A��kYW���o�뿣$���W������f�}��M�?��k��W������3AK�S*zWF˜%�F��%���v��k_��t;��^j�������h2��b��Yn���h���Q��Tk�_O��N����������d1���dP4Ǒ��ѿ�F�I��!�!�eL���E�����c|��>����W��}�Џv�֋��➟���gz]���`a�/Z}̏��c�_n����"cM�Wju[���4���m�j�S�� �Y��ަ�5�Ւ����M=+R(h5���~�k�SŦ�gS�C�)-i[�Z"�@M�}	�L��W�g�=<�+�1�YSUTz X.�EA&L�^cLU�k�>�1��� ���-[��HP�Vp�rt���?	H	D;t; �QpL �(�n;f?$�/�P�hܣ�Tdhc�����K����ю�l�aP�ss���0�0'�tzzSO�-�Q��N4��`mz=�z1*FOtȣz�~�1	���+h��rB����Y�����!?a:��s
�����H]��]؂��Nm�Y�9,r��<=���9���6�U��Y���q{$���U['蝠w��	z�4�5Wn����S��n_��M�����Q��o�^��O������V�~"��"ͷk�j�4� �cƾa]�4�M���oi�¾_rB؏@�W�$o>:� \�������U�X�W�o�:ຽ\�W�����be�d���
U�c�3��w8aW�FaL��}bi�p�����}��a��sBA[>��"�>���=����.�Җ����8�2T��e���Wu	���z���p�Xw��9��2��l��
)~��W�N�J|�c�[K����>K,I��?�9VvĎbNƓj\�l���q�C�=��^ɽH�ws�@�VW����{X�[�^���O����B=�k.����t.���ˎ2�e��)�����u����ޣ�U�(��!�DG��1�<��xn��lX���X��a���M���6A���ܨeF�F�s��D�p���\�@�!L��b��&���v��	n�2��W��r��G����b_����f�����/��?k�^E��i�-��M?M�?&ڶ~
����[��~�	z?zo��khx _�/ ���m�{�n/��:��oC����}���J3����'"T��{�7���y!Ѕ�HyB&����WO#�<�^`I���L^�a�� ΁w/�O6;_�	)��XZ�f���km��6��w������E��%����DC9�&yp�26UcI�1��� ��0��x�aC�	�56��#	d�46UcQ�]�}Ί>�m8<by	�W�}�<�0S�{�BoѸ�>�.�����)?��h���'P�}��Z��0�?�:���X�� ����U�,(^960�;H\�]'6>K`�s��g����*�9P�H���qp�@��;����O8�U��L�0����Y8l�V�xǽAA����xB�	�G�Lh����k�B㉈������`_Wu��w��r�����dULo��{P��VyP+��@�&�%��n��lF͉�L�J��u��ɚ3>�B�^���V��j���Ɖ��:n�3���(W����R����G\�@��L��	i��eۤ�~nG�w�qa�A�L���'�5��yG�d�fz
�k1��y�Ἡԋ��ѱPߌ��W5��x�y����@�_���1F�X��3�$�N֍9��IKt�8�4c2f,��Y��,F^�<���&Lp<���Op����zU<c�'6��xb㉍'6��x/=����Olܟ\갂�[8%���MX#�iͯ�����6��hl�6�쾫F�ޕ�w?��u�S=ލ��f���?��#��ĿU�0�u�HY�c�pfŅϑ(�y�4☸���q��H� wcR�Iy�3��c��$aDDc�k�-ڻ(�ͪ�q�F�<k��Y��8��n����f	�Y{��p�k2
(��x��<����@��m�l��@yl�a��/\�H���Q� �ah7t�� M�;��D��~i�;3��L�3�����t5�������g�wkc^a��/�B�	>g�ߏ���6?�]�v���6��[������wf���C���y�ńqZ�M1 ����x�<�c>��y�*ι�÷@�5-�4JGy	L��Ӎ���"�[?��=I�M�s��
�.�����5�I_'��.`�ۧ�`�-�}[4�/�d�?��� ��Qm#O.+{*ό��<���
�Y�b��ϫ T4�����#��3�i� �9������^��gA���u��^�W���SA$�����.i�a��a"�a��W"�	{��p���⍖�/i�bQ�s�GF��Y�&���wb߉}�2��n�3Č�1�3����3�w��Θޯ�gL�gL�:v+���|7!w����e1t,Gǯ"ҪYz�1k����
̠w�A%�ğ@��:�#FֲŘT���Fl.�3("f{F��~Yry�"���4�2fm�v	cx[�Ԭ�])7��sY?��X 4  �t�Wf����Q^ʁVG�<��.?�"Re��))��L!<���>�㹌���X^=2���9�����#�w�ԝ4fy�g�i��h���=��x���b�\8ѮxlV��8bi��'�$&�Xh�y�a�"M��g��{�N��+��A��k�4D�u�Cd�݉v'ڝh�+���;#zgD�������Oz�xޣ���2�y'���3��O��{U{�x�{�kuVj[�P��Ò��d�����H��h^E��DHV�v1A�����h�����u�v�����켙hS�l��6e�Y& �E�4�7��Q���G:ᩋ�%Î��s�Fɦ���f��B��Nx�C�o�h�]n��t8���kR���j��֫��#K�2��e�[ *�<g�^�,ƚv��;�V���l�;�׃���g�,0�k�{T��
�1Gwet2`����N�(O�����kl����M <�� i <c{gl�흱�3��+bn���{{�$�n�o ��3�w��6�|��gF��(�?.ʷ�Q[TS����q����������X�t�}$�ƹ��R��8����߅�	�(a�R��[A���k@��J޴���"�Ʈ�N��]�/��˯���QbU�j���}%*�M�����U!�Mi���B[���_��@�U��ݏ:�v�#�6��
E���a��r�2�W��5n��*N9�QtC^�Q�)ף��8P^M���Z_UH�|��/�b3ڸ�X7���<I�Bƒ�睘50~.q��z֊��n������##y�t�t�Q�N�;A��_��H��;#yg$�_�8[e[Lxy�ag��֝�uF��hݣ?�@���q�m���U�!��J�'��0z��
5`C�z��Ց�+F���6��4��ކ}���&������+�2˖
��*���q��~h�/�׵�?7����j�X�7��=�pw��4�U#m�B�e?��A�LҰ��eX�/[� 5F�����ߑAT�o��ep���*����<������5ͯ�l.E#��.��H�!�~��&YPH��e�|�~`��=!���ׅ���lh���d[�I�m��/K�ie����0~�5�����Z�`�n�И/�Nt;��D�_����;cpg������
��w#��0�ی�����e�y{�?3�vF��i���
���udD�z��N�M��6Z��q�Jݔa6z�ѣ��{!��[���D]��L�u��Z7�Zl���6���,�Ay~؄�:z�㉎���lŏ|�{J?E�n5I�@��R��1=¬��T� G�1NWQ'�VQ�~TYѸ��.:��.߻i>��|4�H�����$��#w��e�펎�LC��n���~�]Ql̜��HJ�v�������<:f"/�6}��D�S�&Z���개dQ���}17Q���ʄ��1F>ɨ7?�!L�D�Ot<��D�Ot<��D�ϣ�&:��x�㉎':� :&Y	Y�"#(��q0C���'?�&�j"���Z�6@�!�х)tIX�d�i�Uxr��G���ߧ������      �      x������ � �      �   �   x�e��
�0@����+�&��&ءC�n��ě��A��T(����)ltp�@��Р*[(Q�M��-A���^_��o��9O�Q<���s)�d� ����M�ѹQ����E�;o�����wc��?elK:3���Ń�����e��B�����Z�VSM���<ꪪ>��9J      �   �  x�m�Io�0�����W��I��x��8@l�F��p��ֱ��A��^�EP08 0�������(V�A�#�I���)ǌ�ʈA0D[�K�8�*��qf��V�h��ue�3,�p�VӺ~{�<����7��ǓA;��vW}\�S��Ln�YwΝ�Z�t�'�֤\��Y����iT��7���m}��>�?�6Tu&��jڐ�0�V̺�8OJd�ր�\Е�jx�ϛ����p����t\���7c��8�s���bsS���5��vꜿIk�޲�ח4�ւ�z�=��`����Kg����� ��P$D *�($�e�*�82B�j�Q�0ļ�b�$�����u�%�ol��O�il��IG��ڭ�ͷ�y?����t�\�����UZl��/����8J_�Y���%kN<C^�
�$��4Rq+�XD1�kD���?RK��_YōF�7��V      �   w   x��̻�0 �����\�/�|8�h�m<%��@��s�j��>]�L�W���h_��Ti���8����cN�0J:��B�Ib�q`�Cd	&F�x��%��;�{�1~cp<�      �   �   x�u�KR�0  �u�K�p(�Z�)Ii!�3I�&��Z-pz��۷{����\�#�P��� �8�teo���x$T�prY/3Q�37\e�l� �ʉYX�t�:-�������(8�5T$�#����D�G<v�A�:@yYXD�9+o���U��X�}Q�t�mQ��+u��}��	�%p>Ye/�w}}��ޭ5+~h������i鏿����{]��{��^pnmK$�Y�a�WU�      �   �  x��Ko1��ɧXģ<�fƞ�cO qF����m������ HHܚ/�7��&ݬ"�*�l����Z�EP��C��|�m�È���r�2�4=�ΎG��io��P[rM����u�R%Y5���t��B٠m���$�X�i�ˍ�B+��gi�OO�w��bl8D�j��\c�r�����t�2P`���䌮	�k�"����ɫ 1_���jH	Ū�@�6��
qq��l(�l�'S��ړJ�6��㉟A�^Ȑ.!�Bj$5H�3��r�H�N�ڍ+מtٗ��:�oט�@��|�n�m_%����/���.�W��62�X�a���gU< �L�@e�2� %�`X"���|\��'J�v�=�����o��4s�mV�-h�-��q��QT����w�H��O�NR��\he!�a0�:a����tA���ՐNG���
i��u�]ѐ�ll��
�t���;w_�{x���G�s�6U����::����������������r�������{����d,���F����������>�����C�K20G�.�ʹ�j�EM�F:a�Ӯ�K.�J�D��ngnsn��%��0�a������U���zT�π�r���ٷ^{�'��V�C&�.��=������m���u}�ZM슦e�pn���X#��M7���c������l�g�ޒ���"�UsB�;s�D���?ũ�      �     x�՗Y��NƯͧ���J��f�*
�(�B�*���&(�|�?�8�����ޛT��rZ��s�>�ء!�k�]���9ضlh� �qQ'5C��t�{��,3�����d�e'�{�Gd~����j��"��[z4��".a1̬e��d�Y9i.n>�!��$�t[t ���X�b�1�D��.����]K�"&m����k���|_,t�E�D=��@F� ��vgB�(����ǫ��b�/썳�[Υ�C�v��|�����r��j5�Ë3>6�����ӤaKv���:��D�yN�7�?i�_��(� ��;@36K����"���������l���a&&��-6Q9�y���s�ϥ��r�ƻ�`���nD� Oq,�w���y׽ه�~I��f��xff�O���kз�W��?	5Ri��fD��~U���3��D7鞬&F#�V�"�d6��E������A��Cށ��'i���	��[�~�:'Y� �1zR��������3�����2���]݉�F-��x�}�,���!EKuZ|�N�������h�� �
��7��u�Yc�_������	T;�8��m�j�ϙ��_��8�Ȥ﯂!\ikz��+)�#��o;��To -��i�_�I�����`���0V.O���{�v��f��vK����ئ���G�it�?� 	��\��������VN���3�̜��^s�����U�e֋��������z��+oy�E����I��h�O��x$z|�h�gpp}�Ko^��!zh�M�f)�[��-�OțC�=j,�E��(�-�I�(ƹ���3!n�R��<ѾjB�S
�t�7� 4e]T]N6�eWW�G�|%�~	�+���P��j�&��ܢv�_�V=�
��U�,2[�O��I��$��w'!��̲*I��m��?��1=�(�`�����:ͦ�-��)��tf���J��E(�:����7Ͱ��+����rk�]�uk�{��W���B����h����U�ʛ�2LN�MZ���z"�|��CSFį���u1j�b�+�Z�X�zF҇N@R?L��6�/"�M��ޅ�(�󬜍��3���`2\�Ƅ�%U�c�Aeb�����eG��|sj��@
"�g��Ilm��.�~=�+��{�4H�¥4mڧR�k��+�I$J��ҝ��ly�ҷ-m>v�� ,�DP�)k�4�\�����ͨ,<�\������B�����?�3͹�eݠC�wП�wi?r��m��8��n}�_���*�����S���qM�+m��"���>6}�o<_�h������Z�#�ex��o�~�-���r���)|�S�����E�׾x��E�Iq���|I#m�lF�(�rr�������v�0YҲԠ>zWn=ȵ������ֆ?��J
�w�6�� ;���'�����<��հ�]��R�/l*�x}{�f]�9�E_Cn(D�as���	ͲN�D�z�Ow"ֲN�I�v{/GlKx˽1=��dy��c�d���i����i��Z�L��c�?�Jșr����mW�Y[P�Og���6�A�n�#�8���#�=��(���G�vZ�wv����b(u�i��T��;��͢��(���b��ŕ`�։�Ÿ�$�A�gS٭�t7W�[
7w�y2���$����(2���7∃��{P�a	�+�O'�v�����_��f����Uɝ"����b$ft��$![���A璷�|���N�*8m)��w���q�k���{K!�b���x�_�>����     