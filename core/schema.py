from pydantic import BaseModel, Field
from typing import List, Optional, Literal, Dict, Any

class Domain(BaseModel):
    min: Optional[float] = None
    max: Optional[float] = None

class VarSpec(BaseModel):
    name: str
    type: Literal["Real", "Int", "Bool"]
    domain: Optional[Domain] = None
    unit: Optional[str] = None
    source: Optional[str] = None  # e.g., "csv:car"

class ConstraintSpec(BaseModel):
    id: str
    desc: str
    expr: Any  # S-expression as nested lists, e.g., ["AND", ["GE","CAR",200], ...]
    weight: Optional[int] = 1
    domain: Optional[str] = None  # labeling only
