"""
spread_calculator.py — Interpolation taux BDT (logique VBA officielle BAM).
Re-export depuis vba_equivalent_rates pour compatibilité avec core/.
"""
from __future__ import annotations

from vba_equivalent_rates import (  # noqa: F401
    calcul_taux,
    interpol,
    conversion_actu_monnaitaire,
    mati,
)

__all__ = ["calcul_taux", "interpol", "conversion_actu_monnaitaire", "mati"]
