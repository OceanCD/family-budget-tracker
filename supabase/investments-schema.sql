-- Family Budget Tracker - Investment Portfolio Schema
-- Run this in Supabase SQL Editor to create the required tables

-- Platforms table: Track investments by platform (IBKR, Binance, HSBC, etc.)
CREATE TABLE IF NOT EXISTS platforms (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  platform_type TEXT NOT NULL CHECK (platform_type IN ('Brokerage', 'Crypto', 'Bank', 'Fund', 'Other')),
  invested_value REAL NOT NULL DEFAULT 0,
  current_value REAL NOT NULL DEFAULT 0,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE platforms ENABLE ROW LEVEL SECURITY;

-- Allow public read/write
CREATE POLICY "Anyone can read platforms" ON platforms FOR SELECT USING (true);
CREATE POLICY "Anyone can insert platforms" ON platforms FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can update platforms" ON platforms FOR UPDATE USING (true);
CREATE POLICY "Anyone can delete platforms" ON platforms FOR DELETE USING (true);

-- Snapshots table: Track portfolio value over time
CREATE TABLE IF NOT EXISTS snapshots (
  id SERIAL PRIMARY KEY,
  date DATE NOT NULL,
  total_value REAL NOT NULL,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE snapshots ENABLE ROW LEVEL SECURITY;

-- Allow public read/write
CREATE POLICY "Anyone can read snapshots" ON snapshots FOR SELECT USING (true);
CREATE POLICY "Anyone can insert snapshots" ON snapshots FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can update snapshots" ON snapshots FOR UPDATE USING (true);
CREATE POLICY "Anyone can delete snapshots" ON snapshots FOR DELETE USING (true);
