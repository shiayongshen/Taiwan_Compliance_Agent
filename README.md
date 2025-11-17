# Compliance Case Automatic

## Overview

This project is an automated compliance case processing system designed to enhance the efficiency and accuracy of regulatory compliance review. It leverages advanced SMT (Satisfiability Modulo Theories) solvers and Large Language Models (LLMs) to automatically validate compliance requirements and generate optimal remediation strategies.

## 🎉 Important Announcement

**We are proud to announce that this research has been accepted by AIWARE 2025!**

Our innovative approach and research findings will be presented and showcased at the AIWARE 2025 conference.

## Key Features

- **Automated Compliance Validation**: Automatically check regulatory compliance using SMT solver-based constraint solving
- **LLM-Powered Analysis**: Leverage state-of-the-art language models for intelligent case judgment and analysis
- **Constraint Specification**: Define complex compliance rules as formal constraints (hard/soft constraints)
- **Optimization & Repair**: Generate minimum-change solutions to remediate non-compliant cases
- **Comparative Analysis**: Compare LLM judgments with ground truth results from SMT solvers
- **Detailed Reporting**: Generate comprehensive Excel reports with statistical analysis

## Project Structure

```
compliance_case_automatic/
├── marco/
│   ├── json2z3.py              # Convert JSON constraints to Z3 expressions
│   └── ...
├── outputs/                     # Case data and constraint specifications
│   ├── case_0.constraint_spec.json
│   ├── case_0.facts.json
│   ├── case_0.varspecs.json
│   └── ...
├── outputs_RQ3/                # SMT solver results (ground truth)
├── outputs_RQ3_llm_correction/ # LLM analysis results
├── Optimize_execute.py         # Z3 optimization solver execution
├── experiment_hard_constraints.py  # Hard constraint experiments (RQ2)
├── experiment_rq3_correction_llm.py # LLM correction experiments (RQ3)
├── filter_sat_observations.py   # Filter and analyze SAT observations
└── README.md                    # This file
```

## Research Questions

### RQ1: Baseline Performance
Establish the baseline performance of SMT solvers on compliance case validation.

### RQ2: Impact of Hard Constraints
Investigate how imposing hard constraints (fixed fact values) affects the number of required modifications and solution space.

**Experiment**: `experiment_hard_constraints.py`
- Randomly select facts to become hard constraints (0.01 - 0.5 ratio)
- Compare flip rates between cases with/without hard constraints
- Analyze impact on search space and solution optimality

### RQ3: LLM Validation & Correction
Evaluate LLM performance in compliance case judgment and compare with SMT ground truth.

**Experiment**: `experiment_rq3_correction_llm.py`
- Use GPT-4 Mini to judge compliance cases
- Compare LLM judgments with SMT solver results
- Analyze correctness and identify improvement opportunities

## Installation

```bash
# Clone repository
git clone <repository-url>
cd compliance_case_automatic

# Install dependencies
pip install -r requirements.txt

# Set up environment variables
export OPENAI_API_KEY="your-api-key"
export OPENAI_MODEL="gpt-4-mini"
```

## Usage

### 1. Run SMT Optimization (Baseline)

```bash
python Optimize_execute.py case_0
```

### 2. Run Hard Constraint Experiments (RQ2)

```bash
python experiment_hard_constraints.py
```

This will:
- Process case_0 to case_86 (87 cases total)
- Randomly divide cases into two groups
- Group 1: Run with random hard constraints
- Group 2: Run baseline (no hard constraints)
- Generate `outputs_RQ3/experiment_results_*.xlsx`

### 3. Run LLM Correction Experiments (RQ3)

```bash
python experiment_rq3_correction_llm.py
```

This will:
- Load SMT ground truth from RQ2 experiments
- Run GPT-4 Mini on all 87 cases
- Compare LLM judgments with SMT results
- Generate `outputs_RQ3_llm_correction/rq3_llm_correction_results_*.xlsx`

### 4. Analyze SAT Observations

```bash
python filter_sat_observations.py
```

Filter cases where both ground truth and LLM validation results are SAT.

## Data Format

### Case Constraint Specification (`case_X.constraint_spec.json`)
```json
[
  {
    "id": "constraint_1",
    "name": "Capital Adequacy Rule",
    "expr": ["GE", ["VAR", "own_capital"], 1000000],
    "weight": 1,
    "description": "Own capital must be >= 1,000,000"
  }
]
```

### Facts (`case_X.facts.json`)
```json
{
  "own_capital": 1790000,
  "capital_insufficient_plan_executed": false,
  "improvement_plan_submitted": true
}
```

### Variable Specifications (`case_X.varspecs.json`)
```json
[
  {
    "name": "own_capital",
    "type": "Real",
    "description": "Own capital amount"
  }
]
```

## Experimental Results

### Results Summary Structure

Each experiment generates Excel files with the following sheets:

1. **Results Sheet**: Detailed results for each case
   - Case ID, Hard constraint count, SAT/UNSAT result
   - Flip count, flip rate, affected variables
   - Execution time

2. **Summary Sheet**: Statistical overview
   - Total cases, success/failure counts
   - Average metrics (flips, flip rate, execution time)
   - Comparison between cases with/without hard constraints

3. **Distribution Sheet**: SAT/UNSAT distribution
4. **Analysis Sheet**: Detailed analysis of SAT cases

## Key Findings

- **Hard Constraint Impact**: Cases with fixed constraints show different optimization behavior
- **Non-Fixed Flip Rate**: Isolating the flip rate of modifiable variables reveals optimization efficiency
- **LLM Validation**: LLM judgments can be validated against SMT solver ground truth
- **Correction Potential**: Identifies cases where LLM performance differs from optimal solutions

## Technology Stack

- **Python 3.8+**
- **Z3 SMT Solver**: Constraint solving and optimization
- **OpenAI API**: GPT-4 Mini for LLM analysis
- **Pandas**: Data manipulation and Excel reporting
- **scikit-learn**: Machine learning utilities
- **matplotlib/seaborn**: Visualization

## Dataset

- **87 compliance cases** (case_0 to case_86)
- **Constraint specifications**: Rule-based compliance requirements
- **Fact sets**: Initial case states
- **Variable domains**: Boolean, Integer, Real-valued variables

## Output Files

- `outputs_RQ3/experiment_results_*.xlsx` - Hard constraint experiment results
- `outputs_RQ3_llm_correction/rq3_llm_correction_results_*.xlsx` - LLM validation results
- `sat_observations.csv` - Filtered SAT observation cases

## Contact

For questions or inquiries, please contact: [113356046@g.nccu.edu.tw]

## Acknowledgments

- AIWARE 2025 for accepting this research
- Z3 SMT Solver developers
- OpenAI for GPT-4 API access