-- Admin table setup for ThefinalCats
-- The app (LoginAdmin.aspx) creates this table automatically with a default
-- 'admin' / 'admin' account if it is missing. Run this script manually only if
-- you want to (re)create the table or change the credentials yourself.

IF OBJECT_ID('adminTbl', 'U') IS NULL
BEGIN
    CREATE TABLE [adminTbl] (
        mName NVARCHAR(50) NOT NULL,
        mPw   NVARCHAR(50) NOT NULL
    );
END

-- Seed / update the default admin account (change these values as you like):
IF NOT EXISTS (SELECT 1 FROM adminTbl WHERE mName = 'admin')
    INSERT INTO adminTbl (mName, mPw) VALUES ('admin', 'admin');

SELECT * FROM adminTbl;
