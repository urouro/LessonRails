# -*- coding: utf-8 -*-
class MemberController < ApplicationController

  def list
    members = Member.all;
    render :json => members;
  end

  def add
    name = params[:name]
    age = params[:age]

    if name.nil? || name.empty?
      render :json => _error_array('002', '不正なパラメータです')
      return
    end

    member = Member.new(name: name, age: age)
    if member.save
      members = Member.all
      render :json => members
    else
      render :json => _error_array_db
    end
  end

  def update
    id = params[:id]
    name = params[:name]
    age = params[:age]

    if id.nil? || id.empty? ||
       name.nil? || name.empty?
      render :json => _error_array('002', '不正なパラメータです')
      return
    end

    member = Member.find(id)
    member.assign_attributes(name: name, age: age)
    if member.save
      members = Member.all
      render :json => members
    else
      render :json => _error_array_db
    end
  end
    

  def delete
    id = params[:id]

    if id.nil? || id.empty?
      render :json => _error_array('002', '不正なパラメータです')
      return
    end

    member = Member.find(id)
    if member.destroy
      members = Member.all
      render :json => members
    else
      render :json => _error_array_db
    end
  end

  def _error_array_db
    _error_array('001', '不明なエラーが発生しました')
  end

  def _error_array(error, message)
    array = {
      'result' => 'false',
      'error' => error,
      'message' => message,
    }

    array
  end
      

end
