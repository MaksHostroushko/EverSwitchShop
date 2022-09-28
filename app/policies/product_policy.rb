# frozen_string_literal: true

class ProductPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    user.present? && user.role_admin?
  end
  alias_method :fetch_products?, :edit?
  alias_method :update?, :edit?
  alias_method :destroy?, :edit?
end
