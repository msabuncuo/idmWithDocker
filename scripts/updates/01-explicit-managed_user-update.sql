-- Update script for managed_user explicit table
-- Need to add columns for activedate, inactivedate, expireaccount and activateaccount
ALTER TABLE openidm.managed_user
ADD COLUMN activedate VARCHAR(29),
ADD COLUMN inactivedate VARCHAR(29),
ADD COLUMN expireaccount TEXT,
ADD COLUMN activateaccount TEXT;