from environment_mdp import MDP
from agent_knowledge_dp import Agent
from graphics import GraphicsHandler
import transition_graph
import numpy as np

def expected_value(state, action, agent):
	"""Computes the expected value of the current state"""
	expected_value = 0
	gamma = agent.gamma()
	"""
	Your code here
	Useful functions -
	- agent.perceived_next_states(tuple(state, action))
	- agent.transistion_info(state, action, next_state)
	"""
	return expected_value
	
def argmax_action(state, agent):
	"""Returns the action having the maximum Q value"""
	best_action = None
	best_action_value = -float('Inf')
	for action in agent.perceived_actions(state):
		exp_val = expected_value(state, action, agent)
		if exp_val >= best_action_value:
			best_action = action
			best_action_value = exp_val
	return best_action
			
def policy_iteration(agent):
	#initialisation
	tolerable_error = 0.1
	agent.randomise_state_values()
	agent.randomise_policy()
	# while True:
	for i in range(100):
		#policy evaluation
		policy_stable = True
		while True:
			max_error = 0
			for state in agent.perceived_states():
				if agent.is_terminal(state):
					continue
				"""
				Your code here
				Useful functions -
				- agent.value(state) 
				- agent.policy()
				- expected_value (defined above)
				- agent.update_state_value(state, new_value)
				"""
				max_error = max(max_error, abs(agent.current_value - agent.value(state)))
			if max_error < tolerable_error:
				break
		#policy improvement
		for state in agent.perceived_states():
			if agent.is_terminal(state):
				continue
			"""
			Your code here
			Useful functions -
			- agent.policy()
			- agent.update_policy(state, new_best_action)
			"""
			if old_best_action != agent.policy()[state]:
				policy_stable = False
		if policy_stable == True:
			break

if __name__ == "__main__":
	mdp = MDP()
	mdp.model(transition_graph)
	agent = Agent()
	agent.perceive(mdp)
	policy_iteration(agent)
	# print(agent.activity_log)
	GraphicsHandler(agent.activity_log).visualise()
