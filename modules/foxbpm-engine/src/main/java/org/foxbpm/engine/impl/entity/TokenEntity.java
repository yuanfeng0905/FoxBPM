package org.foxbpm.engine.impl.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.foxbpm.engine.db.HasRevision;
import org.foxbpm.engine.db.PersistentObject;
import org.foxbpm.engine.execution.ConnectorExecutionContext;
import org.foxbpm.engine.impl.Context;
import org.foxbpm.engine.impl.identity.Authentication;
import org.foxbpm.engine.impl.util.ClockUtil;
import org.foxbpm.engine.runtime.Token;
import org.foxbpm.kernel.process.impl.KernelFlowNodeImpl;
import org.foxbpm.kernel.runtime.impl.KernelProcessInstanceImpl;
import org.foxbpm.kernel.runtime.impl.KernelTokenImpl;
import org.foxbpm.kernel.runtime.impl.KernelVariableInstanceImpl;

public class TokenEntity extends KernelTokenImpl implements Token, ConnectorExecutionContext, PersistentObject, HasRevision {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected String processInstanceId;
	protected String nodeId;
	protected String parentId;
	protected Date startTime;
	protected Date endTime;
	protected Date nodeEnterTime;
	protected Date archiveTime;
	protected boolean isLocked = false;
	protected boolean isSuspended = false;

	protected List<TaskEntity> tasks;

	protected TaskEntity assignTask;

	@Override
	public void setFlowNode(KernelFlowNodeImpl flowNode) {
		if (flowNode != null) {
			setNodeId(flowNode.getId());
		}

		super.setFlowNode(flowNode);
	}

	@Override
	protected void ensureFlowNodeInitialized() {
		if ((currentFlowNode == null) && (nodeId != null)) {
			currentFlowNode = getProcessDefinition().findFlowNode(nodeId);
		}
	}

	@Override
	protected void ensureProcessInstanceInitialized() {
		if ((processInstance == null) && (processInstanceId != null)) {
			processInstance = Context.getCommandContext().getProcessInstanceManager().findProcessInstanceById(processInstanceId);
		}
	}

	@Override
	public void setProcessInstance(KernelProcessInstanceImpl processInstance) {
		setProcessInstanceId(processInstance.getId());
		super.setProcessInstance(processInstance);
	}

	@Override
	public void setParent(KernelTokenImpl parent) {
		setParentId(parent.getId());
		super.setParent(parent);
	}

	@Override
	public void enter(KernelFlowNodeImpl flowNode) {
		setNodeEnterTime(ClockUtil.getCurrentTime());
		super.enter(flowNode);
	}

	@Override
	public String getId() {
		return this.id;
	}

	public void setRevision(int revision) {
		// TODO Auto-generated method stub

	}

	public int getRevision() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int getRevisionNext() {
		// TODO Auto-generated method stub
		return 0;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getProcessInstanceId() {
		return processInstanceId;
	}

	public void setProcessInstanceId(String processInstanceId) {
		this.processInstanceId = processInstanceId;
	}

	public String getNodeId() {
		return nodeId;
	}

	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Date getNodeEnterTime() {
		return nodeEnterTime;
	}

	public void setNodeEnterTime(Date nodeEnterTime) {
		this.nodeEnterTime = nodeEnterTime;
	}

	public Date getArchiveTime() {
		return archiveTime;
	}

	public void setArchiveTime(Date archiveTime) {
		this.archiveTime = archiveTime;
	}

	public boolean isLocked() {
		return isLocked;
	}

	public void setLocked(boolean isLocked) {
		this.isLocked = isLocked;
	}

	public boolean isSuspended() {
		return isSuspended;
	}

	public void setSuspended(boolean isSuspended) {
		this.isSuspended = isSuspended;
	}

	public Map<String, Object> getPersistentState() {
		// TODO Auto-generated method stub
		return new HashMap<String, Object>();
	}

	public boolean isModified() {
		return true;
	}

	@Override
	public ProcessInstanceEntity getProcessInstance() {
		return (ProcessInstanceEntity) super.getProcessInstance();
	}

	public Object getVariableLocal(Object variableName) {
		// TODO Auto-generated method stub
		return null;
	}

	public String getInitiator() {
		return getProcessInstance().getInitiator();
	}

	@Override
	protected List<KernelVariableInstanceImpl> loadVariableInstances() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected void initializeVariableInstanceBackPointer(KernelVariableInstanceImpl variableInstance) {
		// TODO Auto-generated method stub

	}

	public String getAuthenticatedUserId() {
		return Authentication.getAuthenticatedUserId();
	}

	public String getStartAuthor() {
		return getProcessInstance().getStartAuthor();
	}

	public TaskEntity getAssignTask() {
		return assignTask;
	}

	public void setAssignTask(TaskEntity assignTask) {
		this.assignTask = assignTask;
	}

	// 任务对象
	// ///////////////////////////////////////////////////

	@SuppressWarnings({ "unchecked", "rawtypes" })
	protected void ensureTasksInitialized() {
		if (tasks == null) {
			tasks = (List) Context.getCommandContext().getTaskManager().findTasksByTokenId(id);
		}
	}

	protected List<TaskEntity> getTasksInternal() {
		ensureTasksInitialized();
		return tasks;
	}

	public List<TaskEntity> getTasks() {
		return new ArrayList<TaskEntity>(getTasksInternal());
	}

	public void addTask(TaskEntity taskEntity) {
		getTasksInternal().add(taskEntity);
	}

	public void removeTask(TaskEntity task) {
		getTasksInternal().remove(task);
	}

}
