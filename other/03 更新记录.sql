USE [ERP]

-- 2012-05-03 �޸��ֽ�����޷���Ȩ������
update ERP.DBO.base_module_list set name = '�ֽ������' where id = 504;

-- 2016-05-06 �ɹ�����ģ��-���� ����Ƿ��ܲ鿴���۵�Ȩ��(���Ȩ�޺��ڱ�Ӧ����ϵͳ�����к͵����йص�Ȩ�޿���)
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (105, '��浥��', 1);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɲ鿴', 'dispaly', 105);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���ɲ鿴', 'dispaly', 105);

-- 2016-06-02 �������ҳ���������ϳ������㣬Ϊ��������Ȩ����
INSERT INTO [ERP].[dbo].[BASE_ACTION_LIST]([ACTION_NAME],[MODULE_ID],[UI_ACTION_NAME])VALUES('��������',402,'labelMaterielInOutCount');


-- 2016-06-04 �������͵����е���������������С����������Ҫ�޸����±���е��ֶ�Ϊfloat����
ALTER TABLE [dbo].[PURCHASE_ORDER] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[PURCHASE_ORDER] ALTER COLUMN ACTUAL_VALUE FLOAT;
ALTER TABLE [dbo].[PURCHASE_ORDER_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[PURCHASE_IN_ORDER] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[PURCHASE_IN_ORDER_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[PURCHASE_SUPPLIER_PRICE_SHEET] ALTER COLUMN ORNM_FROM_VALUE FLOAT;
ALTER TABLE [dbo].[PURCHASE_SUPPLIER_PRICE_SHEET] ALTER COLUMN ORNM_TO_VALUE FLOAT;
ALTER TABLE [dbo].[SALE_ORDER] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[SALE_ORDER] ALTER COLUMN ACTUAL_VALUE FLOAT;
ALTER TABLE [dbo].[SALE_ORDER_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[SALE_OUT_ORDER] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[SALE_OUT_ORDER_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN_EARNINGS] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN_EARNINGS_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN_OTHER] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN_OTHER_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_EARNINGS] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_EARNINGS_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_OTHER] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_OTHER_DETAILS] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[STORAGE_STOCK_DETAIL] ALTER COLUMN VALUE FLOAT;
ALTER TABLE [dbo].[STORAGE_STOCK_DETAIL] ALTER COLUMN STORAGE_VALUE FLOAT;
ALTER TABLE [dbo].[INIT_STORAGE_STOCK] ALTER COLUMN VALUE FLOAT;


--2016-11-4 ����Ԥռ��湦�ܣ�����Ԥռ����(WAREHOUSE_MANAGEMENT_PRO_OCCUPIED)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED]') AND type in (N'U'))
DROP TABLE [dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED]
CREATE TABLE [dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED](
    [PKEY] [int] IDENTITY(1,1) NOT NULL,
    [TRADING_DATE] [datetime] NOT NULL,
    [BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [EXCHANGES_UNIT] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
    [SUM_VALUE] [int] NOT NULL,
    [SUM_MONEY] [money] NOT NULL,
    [MAKE_ORDER_STAFF] [int] NOT NULL,
    [APPLY_STAFF] [int] NOT NULL,
    [ORDERR_REVIEW] [int] NULL,
    [REVIEW_DATE] [datetime] NULL,
    [IS_REVIEW] [int] NULL
) ON [PRIMARY];

--2016-11-4 ����Ԥռ��湦�ܣ�����Ԥռ����嵥��(WAREHOUSE_MANAGEMENT_PRO_OCCUPIED_DETAILS)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED_DETAILS]') AND type in (N'U'))
DROP TABLE [dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED_DETAILS]
CREATE TABLE [dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED_DETAILS](
    [PKEY] [int] IDENTITY(1,1) NOT NULL,
    [ROW_NUMBER] [int] NOT NULL,
    [MATERIEL_ID] [int] NOT NULL,
    [BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [PRICE] [money] NOT NULL,
    [VALUE] [int] NOT NULL,
    [NOTE] [nvarchar](200) COLLATE Chinese_PRC_CI_AS NULL,
        [IS_CANCEL] [int] NULL
) ON [PRIMARY];


ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED] ALTER COLUMN SUM_VALUE FLOAT;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_PRO_OCCUPIED_DETAILS] ALTER COLUMN VALUE FLOAT;


--2017-1-11 �����б�BASE_MATERIEL_LIST���������ϱ���ֶΣ��������볤���޸�Ϊ10
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ADD NUM [nvarchar](20);
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ALTER COLUMN MNEMONIC_CODE [nvarchar](10);

--2017-1-11 ���Ϸ��ࣨBASE_MATERIEL_TYPE���������Ϸ������ֶ�
ALTER TABLE [dbo].[BASE_MATERIEL_TYPE] ADD GROUP_NUM [nvarchar](10);


--2017-1-15 �������Ϻ��������� ��ͷ��Ϣ ������Ŀ��ź���������ֶ�
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT] ADD PROJECT_NO [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT] ADD MAKE_NO [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL;

ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_OTHER] ADD PROJECT_NO [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL;
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_OTHER] ADD MAKE_NO [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL;


--2017-2-18 �����б�BASE_MATERIEL_LIST������Ʒ���ֶ�
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ADD BRAND [nvarchar](20);

--2017-2-18 �ɹ���ⵥ��Ϣ��PURCHASE_IN_ORDER�����Ӻ�ͬ����ֶ�
ALTER TABLE [dbo].[PURCHASE_IN_ORDER] ADD CONTRACT_NUM [nvarchar](30);



--2017-3-5 ���Ӳɹ����뵥��ر�� ����Ԥռ��湦�ܣ�����Ԥռ����(PURCHASE_APPLY_ORDER)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PURCHASE_APPLY_ORDER]') AND type in (N'U'))
DROP TABLE [dbo].[PURCHASE_APPLY_ORDER]
CREATE TABLE [dbo].[PURCHASE_APPLY_ORDER](
    [PKEY] [int] IDENTITY(1,1) NOT NULL,
    [APPLY_ID] [int] NOT NULL,
		[TRADING_DATE] [datetime] NOT NULL,
    [BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
    [PROJECT_NUM] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NULL,
    [PAYMENT_DATE] [datetime] NULL,
    [EXCHANGES_UNIT] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
    [SUM_VALUE] [float] NOT NULL,
    [SUM_MONEY] [money] NOT NULL,
    [SUM_OTHER_COST] [money] NOT NULL,
    [TOTAL_MONEY] [money] NOT NULL,
		[MAKE_ORDER_STAFF] [int] NOT NULL,
		[ORDERR_REVIEW] [int] NULL,
		[REVIEW_DATE] [datetime] NULL,
		[IS_REVIEW] [int] NOT NULL
) ON [PRIMARY];

--2017-3-5 �ɹ����뵥����(PURCHASE_APPLY_ORDER_DETAILS)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PURCHASE_APPLY_ORDER_DETAILS]') AND type in (N'U'))
DROP TABLE [dbo].[PURCHASE_APPLY_ORDER_DETAILS]
CREATE TABLE [dbo].[PURCHASE_APPLY_ORDER_DETAILS](
	[PKEY] [int] IDENTITY(1,1) NOT NULL,
	[ROW_NUMBER] [int] NOT NULL,
	[MATERIEL_ID] [int] NOT NULL,
	[BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[PRICE] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[VALUE] [int] NOT NULL,
	[OTHER_COST] [money] NULL
) ON [PRIMARY];

--2017-3-6 �ɹ���������������Ŀ��ź�ԭʼ���ݱ���ֶ�(PURCHASE_ORDER)
ALTER TABLE [dbo].[PURCHASE_ORDER] ADD PROJECT_NUM [nvarchar](30);
ALTER TABLE [dbo].[PURCHASE_ORDER] ADD SRC_ORDER_NUM [nvarchar](30);


--2017-3-7 ��Ŀ�ܲ��Ϲ����(PROJECT_MATERIE_MANAGER)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROJECT_MATERIE_MANAGER]') AND type in (N'U'))
DROP TABLE [dbo].[PROJECT_MATERIE_MANAGER]
CREATE TABLE [dbo].[PROJECT_MATERIE_MANAGER](
	[PKEY] [int] IDENTITY(1,1) NOT NULL,
	[DATE_TYPE] [int] NOT NULL,
	[DEVICE_MODE] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[MAKE_DATE] [datetime] NOT NULL,
	[BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	
	[PROJECT_NUM] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[MAKE_NUM] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[DEVICE_NAME] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[NOTE] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,
	
	[MAKE_ORDER_STAFF] [int] NOT NULL,
	[DESIGN_ID] [int] NOT NULL,
	[REVIEW_STAFF_ID] [int] NULL,
	[REVIEW_DATE] [datetime] NULL,
	[IS_REVIEW] [int] NULL
) ON [PRIMARY];

--2017-3-8 ��Ŀ�ܲ��Ϲ������ϸ����(PROJECT_MATERIE_MANAGER_DETAILS)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROJECT_MATERIE_MANAGER_DETAILS]') AND type in (N'U'))
DROP TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS]
CREATE TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS](
	[PKEY] [int] IDENTITY(1,1) NOT NULL,
	[BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	
	[ROW_NUMBER] [int] NOT NULL,
	[MATERIEL_ID] [int] NOT NULL,
	[VALUE] [int] NOT NULL,
	[MAKE_TYPE] [nvarchar](10) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[MATERIEL_NOTE] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL
) ON [PRIMARY];

--2017-3-8 �ɹ����뵥���Ȩ�޷���
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (106, '�ɹ����뵥', 1);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'save', 106);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���', 'toolStripButtonReview', 106);

--2017-3-8 ��Ŀ����ҳ��Ȩ�޷���
insert Into [BASE_SUB_SYSTEM_LIST] ([name],ID) values ('��Ŀ����', 8);

insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (801, '�豸�ܲ��ϱ�', 8);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (802, '�����ܲ��ϱ�', 8);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (803, '�����ܲ��ϱ�', 8);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (804, '���ϱ���ʱ��Ȩ��', 8);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (805, '�ܲ��ϱ�������', 8);


insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'save', 801);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���', 'toolStripButtonReview', 801);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'save', 802);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���', 'toolStripButtonReview', 802);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'save', 803);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���', 'toolStripButtonReview', 803);


insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�豸�ܲ��ϱ���ʱ��', 'labelPurchaseOrder', 804);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�����ܲ��ϱ���ʱ��', 'labelPurchaseIn', 804);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�����ܲ��ϱ���ʱ��', 'labelPurchaseInvoice', 804);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ܲ��ϱ����', 'labelInventory', 805);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�豸�ܲ��ϱ����', 'labelInventoryHistory', 805);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�����ܲ��ϱ����', 'labelPurchaseOrderExecute', 805);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�����ܲ��ϱ����', 'labelPurchaseInPayment', 805);



--2017-3-15 �����б�BASE_MATERIEL_LIST�����Ӳ����ֶ�
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ADD PARAMETER [nvarchar](20);

--2017-3-15 �ɹ���ⵥ��ϸ��Ϣ��PURCHASE_IN_ORDER_DETAILS�����Ӻ�ͬ����ֶ�
ALTER TABLE [dbo].[PURCHASE_IN_ORDER_DETAILS] ADD CONTRACT_MATERIEL_NAME [nvarchar](50);

--2017-3-15 xxx���ϱ�¼����棬���ӱ������˱����ť
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('������', 'toolStripButtonChange', 801);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�������', 'toolStripButtonChangeReview', 801);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('������', 'toolStripButtonChange', 802);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�������', 'toolStripButtonChangeReview', 802);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('������', 'toolStripButtonChange', 803);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�������', 'toolStripButtonChangeReview', 803);



--2017-3-16 ��Ŀ�����PROJECT_MATERIE_MANAGER�����ӱ�������˺ͱ��������
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ADD CHANGE_STAFF_ID [int] NULL;
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ADD CHANGE_REVIEW_STAFF_ID [int] NULL;

ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ALTER COLUMN VALUE FLOAT;

--2017-3-20 �ɹ����루PURCHASE_APPLY_ORDER_DETAILS��VALUE �ֶ��޸�Ϊfloat
ALTER TABLE [dbo].[PURCHASE_APPLY_ORDER_DETAILS] ALTER COLUMN VALUE FLOAT;

--2017-3-16 ��Ŀ�����PROJECT_MATERIE_MANAGER�������Ƶ������ֶ�
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ADD MAKE_ORDER_DATE [datetime] NULL;


-- 2017-3-29 ���ϱ������ҳ������Ȩ�޿���
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (806, '�ܲ��ϱ������뵥', 8);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'save', 806);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���', 'toolStripButtonReview', 806);

--2017-3-29 ���ϱ�������(PROJECT_MATERIE_CHANGE_MANAGER)
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PROJECT_MATERIE_CHANGE_MANAGER]') AND type in (N'U'))
DROP TABLE [dbo].[PROJECT_MATERIE_CHANGE_MANAGER]
CREATE TABLE [dbo].[PROJECT_MATERIE_CHANGE_MANAGER](
	[PKEY] [int] IDENTITY(1,1) NOT NULL,
	[DATE_TYPE] [int] NOT NULL,
	[PROJECT_NUM] [nvarchar](30) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[SRC_BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[BILL_NUMBER] [nvarchar](20) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[DESIGN_ID] [int] NOT NULL,
	[CHANGE_REASON] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NOT NULL,
	[CHANGE_MATERIE_ID_S] [nvarchar](100) COLLATE Chinese_PRC_CI_AS NULL,

	[MAKE_DATE] [datetime] NOT NULL,
	[MAKE_ORDER_STAFF] [int] NOT NULL,
	[REVIEW_STAFF_ID] [int] NULL,
	[REVIEW_DATE] [datetime] NULL,
	[IS_REVIEW] [int] NULL
) ON [PRIMARY];

-- 2017-3-29 ���ڿ����ܲı��������ʱ���鿴Ȩ��
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ܲı��������ʱ��', 'labelChangeApply', 804);

-- 2017-4-15 xx�ܲ��ϱ���豸�ͺ��ֶ���չΪ�����Ϊ50�ֽ�
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ALTER COLUMN DEVICE_MODE [nvarchar](50) COLLATE Chinese_PRC_CI_AS NOT NULL;

-- 2017-4-16 ���ƴ������ģ�鱨������Ȩ�޿���
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ڳ��ɱ�����', 'labelCost', 402);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���ϳ�������', 'labelMaterielInOutCount', 402);

-- 2017-4-16 �ɹ�ģ�鱨������Ȩ�޿���
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (150, '�ɹ���������', 1);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (151, '�ɹ�����ʱ��', 1);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (152, '�ɹ�����(ͳ��)', 1);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'labelMateriel', 150);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��Ӧ��', 'labelSupplier', 150);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ��۸���ձ�', 'labelPurchasePirce', 150);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��Ӧ����ʷ�۸��ѯ', 'labelPurchasePirceHistory', 150);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ����뵥��ʱ��', 'labelPurchaseApplyOrder', 151);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ�������ʱ��', 'labelPurchaseOrder', 151);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ������ʱ��', 'labelPurchaseIn', 151);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ���Ʊ��ʱ��', 'labelPurchaseInvoice', 151);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����(����)', 'labelInventory', 152);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��ʷ����(����)', 'labelInventoryHistory', 152);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ�����ִ�����', 'labelPurchaseOrderExecute', 152);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ���⸶�����', 'labelPurchaseInPayment', 152);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ����ͳ��(������)', 'labelAmountCountByMateriel', 152);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ����ͳ��(���ɹ�Ա)', 'labelAmountCountByPeople', 152);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɹ����ͳ��(����Ӧ��)', 'labelAmountCountBySupplier', 152);


-- 2017-4-16 ����ģ�鱨������Ȩ�޿���
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (250, '���ۻ�������', 2);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (251, '��������ʱ��', 2);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (252, '���۱���(ͳ��)', 2);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'labelMateriel', 250);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ͻ�', 'labelCustom', 250);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���ۼ۸���ձ�', 'labelSaleBasePrice', 250);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۱�����ʱ��', 'SalePrice', 251);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۶�����ʱ��', 'labelSaleOrder', 251);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۳�����ʱ��', 'labelSaleOut', 251);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۷�Ʊ��ʱ��', 'labelSaleInvoice', 251);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����(��Ʒ)', 'labelInventory', 252);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��ʷ����(��Ʒ)', 'labelInventoryHistory', 252);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۶���ִ�����', 'labelSaleOrderExecute', 252);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���ۻؿ����', 'labelSaleIn', 252);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۶�ͳ��(����Ʒ)', 'labelSaleCountByProducts', 252);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۶�ͳ��(��ҵ��Ա)', 'labelSaleCountByPeople', 252);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���۶�ͳ��(���ͻ�)', 'labelSaleCountByCustom', 252);


-- 2017-4-16 �ִ�ģ�鱨������Ȩ�޿���
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (350, '�ִ��������', 3);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (351, '�������ʱ��', 3);
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (352, '�ִ汨��(ͳ��)', 3);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'labelMateriel', 350);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����൥����ʱ��', 'labelOrderIn', 351);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�����൥����ʱ��', 'labelOrderOut', 351);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���Ԥռ����ʱ��', 'labelOrderMaterielProOccupied', 351);

insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����', 'labelInventory', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��ʷ����', 'labelInventoryHistory', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���ϳ������ϸ', 'labelOrderInventory', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��Ʒ�����ܱ�', 'labelMaterielCount', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�������ϻ��ܱ�', 'labelMaterielDetails', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('��ȫ���Ԥ������', 'labelInventoryAlarm', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����/��ȱ������', 'labelInventoryAnalysis', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('������������', 'labelInventoryAge', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�������Ϸ�����', 'labelInventoryPassAge', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('������Ԥ������', 'labelInventoryLife', 352);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('����������ͳ�Ʊ�', 'labelProductionOut', 352);



-- 2017-4-21 �ܲ��ϱ��ͷ���֣�ɾ��ʹ�����ں�����������Ϣ
alter table PROJECT_MATERIE_MANAGER drop column MAKE_DATE;
alter table PROJECT_MATERIE_MANAGER drop column DEVICE_NAME; 



-- 2017-4-22 �ܲ��ϱ������,������š����кš�ʹ�����ڡ���������
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ADD NUM [nvarchar](10);
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ADD SEQUENCE [nvarchar](10);
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ADD USE_DATE [nvarchar](15);
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ADD DEVICE_NAME [nvarchar](60);
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ADD CL [nvarchar](60);
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER_DETAILS] ADD SIZE [nvarchar](60);

-- 2017-4-21 �ܲ��ϱ��ͷ���֣�������Ŀ���ƺͲ���������Ϣ
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ADD PROJECT_NAME [nvarchar](100);
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ADD SUB_NAME [nvarchar](60);


-- 2017-5-2 �ɹ����뵥�����ϱ���ϸ��Ϣ������ԭ���ϱ��к��ֶ�
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT_DETAILS] ADD XX_TABLE_ROW_NUM [nvarchar](10);
ALTER TABLE [dbo].[PURCHASE_APPLY_ORDER_DETAILS] ADD XX_TABLE_ROW_NUM [nvarchar](10);

-- 2017-5-31 ��Ʒ������������������ɱ��
ALTER TABLE [dbo].[SALE_OUT_ORDER_DETAILS] ADD MAKE_NUM [nvarchar](30);
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_IN_DETAILS] ADD MAKE_NUM [nvarchar](30);

-- 2017-6-13 xx�ܲ��ϱ���豸�ͺź���������ֶ������Ϊ��50�ֽ���չΪ80�ֽ�
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ALTER COLUMN DEVICE_MODE [nvarchar](80) COLLATE Chinese_PRC_CI_AS NOT NULL;
ALTER TABLE [dbo].[PROJECT_MATERIE_MANAGER] ALTER COLUMN MAKE_NUM [nvarchar](80) COLLATE Chinese_PRC_CI_AS NOT NULL;

-- 2017-6-13 �������ϱ���������ֶ������Ϊ��50�ֽ���չΪ80�ֽ�
ALTER TABLE [dbo].[WAREHOUSE_MANAGEMENT_OUT] ALTER COLUMN MAKE_NO [nvarchar](80) COLLATE Chinese_PRC_CI_AS NULL;


--2017-7-2 �ɹ���ⵥ��Ϣ��PURCHASE_IN_ORDER�����Ӳɹ���ͬ����ֶ�
ALTER TABLE [dbo].[PURCHASE_IN_ORDER] ADD PURCHASE_NUM [nvarchar](80);

--2017-7-2 Ϊ�����ϸ��ҳ�����ӽ��ؼ���Ϣ�鿴Ȩ��
insert into [BASE_MODULE_LIST] (ID, [name], sub_system_ID) values (403, '�����ϸ���', 4);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('�ɲ鿴', 'dispaly', 403);
insert into [BASE_ACTION_LIST] ([action_name],[ui_action_name], module_ID) values ('���ɲ鿴', 'nodispaly', 403);

-- 2017-7-8 �ɹ����뵥���ܲ��ϱ����ֶ��Ϊ��30�ֽ���չΪ80�ֽ�
ALTER TABLE [dbo].[PURCHASE_APPLY_ORDER] ALTER COLUMN PROJECT_NUM [nvarchar](80) COLLATE Chinese_PRC_CI_AS;

-- 2017-7-9 ���ϻ�����Ϣҳ�����Ӳ��ʡ�����1������2��Ϣ
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ADD CZ [nvarchar](80);
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ADD ATTRIBUTE1 [nvarchar](80);
ALTER TABLE [dbo].[BASE_MATERIEL_LIST] ADD ATTRIBUTE2 [nvarchar](80);


-- 2017-12-10 �������ϸ�˱�STORAGE_STOCK_DETAIL������MATERIEL_ROW_NUMBER�ֶΣ������洢ԭʼ������xx�����ڵ����еĶ�Ӧ���к���Ϣ
ALTER TABLE [dbo].[STORAGE_STOCK_DETAIL] ADD  [MATERIEL_ROW_NUMBER] [int];