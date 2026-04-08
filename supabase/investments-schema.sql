-- Family Budget Tracker - Investment Portfolio Schema
-- Run this in Supabase SQL Editor to create the required tables

-- Holdings table: Track current investment positions
CREATE TABLE IF NOT EXISTS holdings (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  asset_type TEXT NOT NULL CHECK (asset_type IN ('Stock', 'ETF', 'Crypto', 'Bond', 'Other')),
  ticker TEXT,
  quantity REAL NOT NULL,
  purchase_price REAL NOT NULL,
  current_price REAL NOT NULL DEFAULT purchase_price,
  purchase_date DATE DEFAULT CURRENT_DATE,
  notes TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable RLS
ALTER TABLE holdings ENABLE ROW LEVEL SECURITY;

-- Allow public read/write
CREATE POLICY "Anyone can read holdings" ON holdings FOR SELECT USING (true);
CREATE POLICY "Anyone can insert holdings" ON holdings FOR INSERT WITH CHECK (true);
CREATE POLICY "Anyone can update holdings" ON holdings FOR UPDATE USING (true);
CREATE POLICY "Anyone can delete holdings" ON holdings FOR DELETE USING (true);

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
