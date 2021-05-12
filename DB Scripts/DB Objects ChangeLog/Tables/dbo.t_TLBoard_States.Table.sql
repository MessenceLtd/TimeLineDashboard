SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [t_TLBoard_States](
	[State_Id] [smallint] NOT NULL,
	[State_Code] [varchar](10) NULL,
	[State_Name] [nvarchar](100) NULL,
	[Country_Id] [smallint] NULL,
 CONSTRAINT [PK_t_TLBoard_States] PRIMARY KEY CLUSTERED 
(
	[State_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [trigger_t_TLBoard_States] ON [t_TLBoard_States]
FOR UPDATE
AS
BEGIN

    --Declare @Change_Description NVarChar(Max) = '';

    --If (inserted.State_Name != deleted.State_Name )
    --Begin
    --    Set @Change_Description += 'State changed to ' + inserted.State_Name;
    --End

    --UPDATE MYTABLE
    --SET mytable.CHANGED_ON = GETDATE()
    --    ,CHANGED_BY = USER_NAME(USER_ID())
    --FROM inserted
    --WHERE MYTABLE.ID = inserted.ID

    --Exec p_TLBoard_Insert_Change_Log 't_TLBoard_States', null, @Change_Description
     DECLARE @bit INT ,
           @field INT ,
           @maxfield INT ,
           @char INT ,
           @fieldname VARCHAR(128) ,
           @TableName VARCHAR(128) ,
           @PKCols VARCHAR(1000) ,
           @sql VARCHAR(2000), 
           @UpdateDate VARCHAR(21) ,
           @UserName VARCHAR(128) ,
           @Type CHAR(1) ,
           @PKSelect VARCHAR(1000)
           
    IF OBJECT_ID('tempdb..#Temp_Audit_Table') IS NOT NULL DROP TABLE #Temp_Audit_Table

    Create Table #Temp_Audit_Table  (
        PK NVarchar(500),
        FieldName Varchar(100), 
        OldValue NVarChar(Max), 
        NewValue NVarChar(Max) 
    );

    --You will need to change @TableName to match the table to be audited. 
    -- Here we made GUESTS for your example.
    SELECT @TableName = 't_TLBoard_States';
    
    -- date and user
    SELECT         @UserName = SYSTEM_USER ,
           @UpdateDate = CONVERT (NVARCHAR(30),GETDATE(),126)
    
    -- Action
           IF EXISTS (
                  SELECT *
                  FROM   INSERTED
              )
               IF EXISTS (
                      SELECT *
                      FROM   DELETED
                  )
                   SELECT @Type = 'U'
               ELSE
                   SELECT @Type = 'I'
           ELSE
               SELECT @Type = 'D'

           -- get list of columns
           SELECT * INTO #ins
           FROM   INSERTED

           SELECT * INTO #del
           FROM   DELETED

           -- Get primary key columns for full outer join
           SELECT @PKCols = COALESCE(@PKCols + ' and', ' on') 
                  + ' i.[' + c.COLUMN_NAME + '] = d.[' + c.COLUMN_NAME + ']'
           FROM   INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
                  INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
           WHERE  pk.TABLE_NAME = @TableName
                  AND CONSTRAINT_TYPE = 'PRIMARY KEY'
                  AND c.TABLE_NAME = pk.TABLE_NAME
                  AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

           -- Get primary key select for insert
           SELECT @PKSelect = COALESCE(@PKSelect + '+', '') 
                  + '''<[' + COLUMN_NAME 
                  + ']=''+convert(varchar(100),
           coalesce(i.[' + COLUMN_NAME + '],d.[' + COLUMN_NAME + ']))+''>'''
           FROM   INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk,
                  INFORMATION_SCHEMA.KEY_COLUMN_USAGE c
           WHERE  pk.TABLE_NAME = @TableName
                  AND CONSTRAINT_TYPE = 'PRIMARY KEY'
                  AND c.TABLE_NAME = pk.TABLE_NAME
                  AND c.CONSTRAINT_NAME = pk.CONSTRAINT_NAME

           IF @PKCols IS NULL
           BEGIN
               RAISERROR('no PK on table %s', 16, -1, @TableName)

               RETURN
           END

           SELECT @field = 0,
                  -- @maxfield = MAX(COLUMN_NAME) 
                  @maxfield = -- FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @TableName


                  MAX(
                      COLUMNPROPERTY(
                          OBJECT_ID(TABLE_SCHEMA + '.' + @TableName),
                          COLUMN_NAME,
                          'ColumnID'
                      )
                  )
           FROM   INFORMATION_SCHEMA.COLUMNS
           WHERE  TABLE_NAME = @TableName


           WHILE @field < @maxfield
           BEGIN
               SELECT @field = MIN(
                          COLUMNPROPERTY(
                              OBJECT_ID(TABLE_SCHEMA + '.' + @TableName),
                              COLUMN_NAME,
                              'ColumnID'
                          )
                      )
               FROM   INFORMATION_SCHEMA.COLUMNS
               WHERE  TABLE_NAME = @TableName
                      AND COLUMNPROPERTY(
                              OBJECT_ID(TABLE_SCHEMA + '.' + @TableName),
                              COLUMN_NAME,
                              'ColumnID'
                          ) > @field

               SELECT @bit = (@field - 1)% 8 + 1

               SELECT @bit = POWER(2, @bit - 1)

               SELECT @char = ((@field - 1) / 8) + 1


               IF SUBSTRING(COLUMNS_UPDATED(), @char, 1) & @bit > 0
                  OR @Type IN ('I', 'D')
               BEGIN
                   SELECT @fieldname = COLUMN_NAME
                   FROM   INFORMATION_SCHEMA.COLUMNS
                   WHERE  TABLE_NAME = @TableName
                          AND COLUMNPROPERTY(
                                  OBJECT_ID(TABLE_SCHEMA + '.' + @TableName),
                                  COLUMN_NAME,
                                  'ColumnID'
                              ) = @field



                   SELECT @sql = 

                   -- was audit instead of @Temp_Audit_Table

           --               '
           --insert into @Temp_Audit_Table (    
           --Type, 
           --TableName, 
           --PK,
           --FieldName, 
           --OldValue, 
           --NewValue, 
           --UpdateDate, 
           --UserName)
           --select ''' + @Type + ''',''' 
           --               + @TableName + ''',' + @PKSelect
           --               + ',''' + @fieldname + ''''
           --               + ',convert(varchar(1000),d.' + @fieldname + ')'
           --               + ',convert(varchar(1000),i.' + @fieldname + ')'
           --               + ',''' + @UpdateDate + ''''
           --               + ',''' + @UserName + ''''
           --               + ' from #ins i full outer join #del d'
           --               + @PKCols
           --               + ' where i.' + @fieldname + ' <> d.' + @fieldname 
           --               + ' or (i.' + @fieldname + ' is null and  d.'
           --               + @fieldname
           --               + ' is not null)' 
           --               + ' or (i.' + @fieldname + ' is not null and  d.' 
           --               + @fieldname
           --               + ' is null)' 

           
                          '
           insert into #Temp_Audit_Table (    
            
           PK,
           FieldName, 
           OldValue, 
           NewValue 
           )
           select ' + @PKSelect
                          + ',''' + @fieldname + ''''
                          + ',convert(NVarchar(Max),d.' + @fieldname + ')'
                          + ',convert(NVarchar(Max),i.' + @fieldname + ')'
                          --+ ',''' + @UpdateDate + ''''
                          --+ ',''' + @UserName + ''''
                          + ' from #ins i full outer join #del d'
                          + @PKCols
                          + ' where i.' + @fieldname + ' <> d.' + @fieldname 
                          + ' or (i.' + @fieldname + ' is null and  d.'
                          + @fieldname
                          + ' is not null)' 
                          + ' or (i.' + @fieldname + ' is not null and  d.' 
                          + @fieldname
                          + ' is null)' 


                   EXEC (@sql);


               END
           END

           if (Exists (Select * from #Temp_Audit_Table ))
           Begin 
               Declare @ChangeLog_Json NVarChar(Max);
               Set @ChangeLog_Json = (Select OldValue,NewValue From #Temp_Audit_Table FOR JSON AUTO, INCLUDE_NULL_VALUES);

               Declare @PK_Param NVarChar(500); 
               Set @PK_Param = (select top 1 PK from  #Temp_Audit_Table);

               Exec dbo.p_TLBoard_Insert_Change_Log @TableName, @PK_Param, -1 , @ChangeLog_Json;
           End
END


GO
ALTER TABLE [dbo].[t_TLBoard_States] ENABLE TRIGGER [trigger_t_TLBoard_States]
GO
