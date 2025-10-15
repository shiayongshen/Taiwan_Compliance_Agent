from autogen import AssistantAgent
from .statute_parser import make_statute_parser
from .case_mapper import make_case_mapper
from .smt_encoder import make_smt_encoder
from .solver import build_solver
from .json_fixer import make_json_fixer
from .constraint_repair import make_constraint_repairer
from .VarSpecAgent import make_varspec_agent
from .repairagent import make_statute_repairer
from .penaltyagent import make_penalty_agent

def build_team(llm_config):
    return {
        "parser": make_statute_parser(llm_config),
        "mapper": make_case_mapper(llm_config),
        "json_fixer": make_json_fixer(llm_config),
        "repair": make_constraint_repairer(llm_config),
        "varspec":make_varspec_agent(llm_config),
        "statute_repairer": make_statute_repairer(llm_config),
        "penalty": make_penalty_agent(llm_config),
        "orchestrator": AssistantAgent(
            name="Orchestrator",
            system_message="你是總控：依序呼叫 StatuteParser 與 CaseMapper",
            llm_config=llm_config,
        )
    }
