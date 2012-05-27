require "chef/resource"
require File.join(File.dirname(__FILE__), "credentials_attributes")

class Chef
  class Resource
    class CouchbaseCluster < Resource
      include Couchbase::CredentialsAttributes

      attribute :id, :kind_of => String, :name_attribute => true
      attribute :memory_quota_mb, :kind_of => Integer, :required => true, :callbacks => {
        "must be at least 256" => lambda { |quota| quota >= 256 }
      }

      def initialize(*)
        super
        @action = :create_if_missing
        @allowed_actions.push :create_if_missing
        @resource_name = :couchbase_cluster
      end
    end
  end
end