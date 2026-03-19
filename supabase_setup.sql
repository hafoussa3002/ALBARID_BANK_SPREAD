-- ═══════════════════════════════════════════════════════════════════
-- SpreadABB — Table de cache persistant des courbes BDT BAM
-- À exécuter UNE SEULE FOIS dans : Supabase → SQL Editor → New query
-- ═══════════════════════════════════════════════════════════════════

CREATE TABLE IF NOT EXISTS bdt_curves (
    date_emission   DATE        PRIMARY KEY,
    courbe_json     JSONB       NOT NULL,
    scraped_at      TIMESTAMP   DEFAULT NOW()
);

-- Index sur scraped_at pour faciliter les requêtes de maintenance
CREATE INDEX IF NOT EXISTS idx_bdt_curves_scraped_at ON bdt_curves (scraped_at);

-- Exemple de structure de courbe_json stockée :
-- {
--   "91":   0.0231,   -- 91 jours  → 2.31%
--   "182":  0.0233,   -- 182 jours → 2.33%
--   "364":  0.0239,   -- 364 jours → 2.39%
--   "728":  0.0244,   -- 2 ans     → 2.44%
--   "1820": 0.0260    -- 5 ans     → 2.60%
-- }
-- Clé = maturité en jours (string), Valeur = taux décimal (ex: 0.0231 = 2.31%)
