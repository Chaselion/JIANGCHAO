package com.zy.dmop.common.helper;

import java.util.LinkedList;

public class InvokeQueue {
	private LinkedList<Runnable> invokeQueue = new LinkedList<Runnable>();
	private LinkedList<Id> idQueue = new LinkedList<Id>();
	
	public Id offerFirst(Runnable toInovke) {
		Id newId = new Id(0);
		idQueue.offerFirst(newId);
		invokeQueue.offerFirst(toInovke);
		
		increaseIdFrom(newId);
		
		return newId;
	}
	
	public Id offerLast(Runnable toInvoke) {
		Id newId = new Id(idQueue.size());
		idQueue.offerLast(newId);
		invokeQueue.offerLast(toInvoke);
		
		return newId;
	}
	
	public Id offerBefore(Id beforeId, Runnable toInvoke) {
		Id newId = new Id(beforeId.getIndex());
		idQueue.add(beforeId.getIndex(), newId);
		invokeQueue.add(beforeId.getIndex(), toInvoke);
		
		increaseIdFrom(newId);
		
		return newId;
	}
	
	public void invoke() {
		for (Runnable r : invokeQueue) {
			r.run();
		}
	}
	
	private void increaseIdFrom(Id fromId) {
		int fromIndex = fromId.getIndex();
		
		for (int i = fromIndex + 1; i < idQueue.size(); i++) {
			idQueue.get(i).increment();
		}
	}
	
	public static class Id {
		private int index;
		
		Id(int index) {
			this.index = index;
		}
		
		public void increment() {
			this.index++;
		}

		void setIndex(int index) {
			this.index = index;
		}
		
		int getIndex() {
			return index;
		}
	}
}
