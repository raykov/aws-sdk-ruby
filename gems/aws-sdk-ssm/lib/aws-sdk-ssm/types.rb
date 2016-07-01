# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module SSM
    module Types

      # Describes an association of an SSM document and an instance.
      class Association < Aws::Structure.new(
        :name,
        :instance_id)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The ID of the instance.
        #   @return [String]

      end

      # Describes the parameters for a document.
      class AssociationDescription < Aws::Structure.new(
        :name,
        :instance_id,
        :date,
        :status,
        :parameters)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The ID of the instance.
        #   @return [String]

        # @!attribute [rw] date
        #   The date when the association was made.
        #   @return [Time]

        # @!attribute [rw] status
        #   The association status.
        #   @return [Types::AssociationStatus]

        # @!attribute [rw] parameters
        #   A description of the parameters for a document.
        #   @return [Hash<String,Array<String>>]

      end

      # Describes a filter.
      # @note When making an API call, pass AssociationFilter
      #   data as a hash:
      #
      #       {
      #         key: "InstanceId", # required, accepts InstanceId, Name
      #         value: "AssociationFilterValue", # required
      #       }
      class AssociationFilter < Aws::Structure.new(
        :key,
        :value)

        # @!attribute [rw] key
        #   The name of the filter.
        #   @return [String]

        # @!attribute [rw] value
        #   The filter value.
        #   @return [String]

      end

      # Describes an association status.
      # @note When making an API call, pass AssociationStatus
      #   data as a hash:
      #
      #       {
      #         date: Time.now, # required
      #         name: "Pending", # required, accepts Pending, Success, Failed
      #         message: "StatusMessage", # required
      #         additional_info: "StatusAdditionalInfo",
      #       }
      class AssociationStatus < Aws::Structure.new(
        :date,
        :name,
        :message,
        :additional_info)

        # @!attribute [rw] date
        #   The date when the status changed.
        #   @return [Time]

        # @!attribute [rw] name
        #   The status.
        #   @return [String]

        # @!attribute [rw] message
        #   The reason for the status.
        #   @return [String]

        # @!attribute [rw] additional_info
        #   A user-defined string.
        #   @return [String]

      end

      # @note When making an API call, pass CancelCommandRequest
      #   data as a hash:
      #
      #       {
      #         command_id: "CommandId", # required
      #         instance_ids: ["InstanceId"],
      #       }
      class CancelCommandRequest < Aws::Structure.new(
        :command_id,
        :instance_ids)

        # @!attribute [rw] command_id
        #   The ID of the command you want to cancel.
        #   @return [String]

        # @!attribute [rw] instance_ids
        #   (Optional) A list of instance IDs on which you want to cancel the
        #   command. If not provided, the command is canceled on every instance
        #   on which it was requested.
        #   @return [Array<String>]

      end

      # Whether or not the command was successfully canceled. There is no
      # guarantee that a request can be canceled.
      class CancelCommandResult < Aws::EmptyStructure; end

      # Describes a command request.
      class Command < Aws::Structure.new(
        :command_id,
        :document_name,
        :comment,
        :expires_after,
        :parameters,
        :instance_ids,
        :requested_date_time,
        :status,
        :output_s3_bucket_name,
        :output_s3_key_prefix)

        # @!attribute [rw] command_id
        #   A unique identifier for this command.
        #   @return [String]

        # @!attribute [rw] document_name
        #   The name of the SSM document requested for execution.
        #   @return [String]

        # @!attribute [rw] comment
        #   User-specified information about the command, such as a brief
        #   description of what the command should do.
        #   @return [String]

        # @!attribute [rw] expires_after
        #   If this time is reached and the command has not already started
        #   executing, it will not execute. Calculated based on the ExpiresAfter
        #   user input provided as part of the SendCommand API.
        #   @return [Time]

        # @!attribute [rw] parameters
        #   The parameter values to be inserted in the SSM document when
        #   executing the command.
        #   @return [Hash<String,Array<String>>]

        # @!attribute [rw] instance_ids
        #   The instance IDs against which this command was requested.
        #   @return [Array<String>]

        # @!attribute [rw] requested_date_time
        #   The date and time the command was requested.
        #   @return [Time]

        # @!attribute [rw] status
        #   The status of the command.
        #   @return [String]

        # @!attribute [rw] output_s3_bucket_name
        #   The S3 bucket where the responses to the command executions should
        #   be stored. This was requested when issuing the command.
        #   @return [String]

        # @!attribute [rw] output_s3_key_prefix
        #   The S3 directory path inside the bucket where the responses to the
        #   command executions should be stored. This was requested when issuing
        #   the command.
        #   @return [String]

      end

      # Describes a command filter.
      # @note When making an API call, pass CommandFilter
      #   data as a hash:
      #
      #       {
      #         key: "InvokedAfter", # required, accepts InvokedAfter, InvokedBefore, Status
      #         value: "CommandFilterValue", # required
      #       }
      class CommandFilter < Aws::Structure.new(
        :key,
        :value)

        # @!attribute [rw] key
        #   The name of the filter. For example, requested date and time.
        #   @return [String]

        # @!attribute [rw] value
        #   The filter value. For example: June 30, 2015.
        #   @return [String]

      end

      # An invocation is copy of a command sent to a specific instance. A
      # command can apply to one or more instances. A command invocation
      # applies to one instance. For example, if a user executes SendCommand
      # against three instances, then a command invocation is created for each
      # requested instance ID. A command invocation returns status and detail
      # information about a command you executed.
      class CommandInvocation < Aws::Structure.new(
        :command_id,
        :instance_id,
        :comment,
        :document_name,
        :requested_date_time,
        :status,
        :trace_output,
        :command_plugins)

        # @!attribute [rw] command_id
        #   The command against which this invocation was requested.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The instance ID in which this invocation was requested.
        #   @return [String]

        # @!attribute [rw] comment
        #   User-specified information about the command, such as a brief
        #   description of what the command should do.
        #   @return [String]

        # @!attribute [rw] document_name
        #   The document name that was requested for execution.
        #   @return [String]

        # @!attribute [rw] requested_date_time
        #   The time and date the request was sent to this instance.
        #   @return [Time]

        # @!attribute [rw] status
        #   Whether or not the invocation succeeded, failed, or is pending.
        #   @return [String]

        # @!attribute [rw] trace_output
        #   Gets the trace output sent by the agent.
        #   @return [String]

        # @!attribute [rw] command_plugins
        #   @return [Array<Types::CommandPlugin>]

      end

      # Describes plugin details.
      class CommandPlugin < Aws::Structure.new(
        :name,
        :status,
        :response_code,
        :response_start_date_time,
        :response_finish_date_time,
        :output,
        :output_s3_bucket_name,
        :output_s3_key_prefix)

        # @!attribute [rw] name
        #   The name of the plugin. Must be one of the following:
        #   aws:updateAgent, aws:domainjoin, aws:applications,
        #   aws:runPowerShellScript, aws:psmodule, aws:cloudWatch,
        #   aws:runShellScript, or aws:updateSSMAgent.
        #   @return [String]

        # @!attribute [rw] status
        #   The status of this plugin. You can execute a document with multiple
        #   plugins.
        #   @return [String]

        # @!attribute [rw] response_code
        #   A numeric response code generated after executing the plugin.
        #   @return [Integer]

        # @!attribute [rw] response_start_date_time
        #   The time the plugin started executing.
        #   @return [Time]

        # @!attribute [rw] response_finish_date_time
        #   The time the plugin stopped executing. Could stop prematurely if,
        #   for example, a cancel command was sent.
        #   @return [Time]

        # @!attribute [rw] output
        #   Output of the plugin execution.
        #   @return [String]

        # @!attribute [rw] output_s3_bucket_name
        #   The S3 bucket where the responses to the command executions should
        #   be stored. This was requested when issuing the command.
        #   @return [String]

        # @!attribute [rw] output_s3_key_prefix
        #   The S3 directory path inside the bucket where the responses to the
        #   command executions should be stored. This was requested when issuing
        #   the command.
        #   @return [String]

      end

      # @note When making an API call, pass CreateAssociationBatchRequest
      #   data as a hash:
      #
      #       {
      #         entries: [ # required
      #           {
      #             name: "DocumentName",
      #             instance_id: "InstanceId",
      #             parameters: {
      #               "ParameterName" => ["ParameterValue"],
      #             },
      #           },
      #         ],
      #       }
      class CreateAssociationBatchRequest < Aws::Structure.new(
        :entries)

        # @!attribute [rw] entries
        #   One or more associations.
        #   @return [Array<Types::CreateAssociationBatchRequestEntry>]

      end

      # Describes the association of an SSM document and an instance.
      # @note When making an API call, pass CreateAssociationBatchRequestEntry
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName",
      #         instance_id: "InstanceId",
      #         parameters: {
      #           "ParameterName" => ["ParameterValue"],
      #         },
      #       }
      class CreateAssociationBatchRequestEntry < Aws::Structure.new(
        :name,
        :instance_id,
        :parameters)

        # @!attribute [rw] name
        #   The name of the configuration document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The ID of the instance.
        #   @return [String]

        # @!attribute [rw] parameters
        #   A description of the parameters for a document.
        #   @return [Hash<String,Array<String>>]

      end

      class CreateAssociationBatchResult < Aws::Structure.new(
        :successful,
        :failed)

        # @!attribute [rw] successful
        #   Information about the associations that succeeded.
        #   @return [Array<Types::AssociationDescription>]

        # @!attribute [rw] failed
        #   Information about the associations that failed.
        #   @return [Array<Types::FailedCreateAssociation>]

      end

      # @note When making an API call, pass CreateAssociationRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #         instance_id: "InstanceId", # required
      #         parameters: {
      #           "ParameterName" => ["ParameterValue"],
      #         },
      #       }
      class CreateAssociationRequest < Aws::Structure.new(
        :name,
        :instance_id,
        :parameters)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The instance ID.
        #   @return [String]

        # @!attribute [rw] parameters
        #   The parameters for the documents runtime configuration.
        #   @return [Hash<String,Array<String>>]

      end

      class CreateAssociationResult < Aws::Structure.new(
        :association_description)

        # @!attribute [rw] association_description
        #   Information about the association.
        #   @return [Types::AssociationDescription]

      end

      # @note When making an API call, pass CreateDocumentRequest
      #   data as a hash:
      #
      #       {
      #         content: "DocumentContent", # required
      #         name: "DocumentName", # required
      #       }
      class CreateDocumentRequest < Aws::Structure.new(
        :content,
        :name)

        # @!attribute [rw] content
        #   A valid JSON string.
        #   @return [String]

        # @!attribute [rw] name
        #   A name for the SSM document.
        #   @return [String]

      end

      class CreateDocumentResult < Aws::Structure.new(
        :document_description)

        # @!attribute [rw] document_description
        #   Information about the SSM document.
        #   @return [Types::DocumentDescription]

      end

      # @note When making an API call, pass DeleteAssociationRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #         instance_id: "InstanceId", # required
      #       }
      class DeleteAssociationRequest < Aws::Structure.new(
        :name,
        :instance_id)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The ID of the instance.
        #   @return [String]

      end

      class DeleteAssociationResult < Aws::EmptyStructure; end

      # @note When making an API call, pass DeleteDocumentRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #       }
      class DeleteDocumentRequest < Aws::Structure.new(
        :name)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

      end

      class DeleteDocumentResult < Aws::EmptyStructure; end

      # @note When making an API call, pass DescribeAssociationRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #         instance_id: "InstanceId", # required
      #       }
      class DescribeAssociationRequest < Aws::Structure.new(
        :name,
        :instance_id)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The instance ID.
        #   @return [String]

      end

      class DescribeAssociationResult < Aws::Structure.new(
        :association_description)

        # @!attribute [rw] association_description
        #   Information about the association.
        #   @return [Types::AssociationDescription]

      end

      # @note When making an API call, pass DescribeDocumentPermissionRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #         permission_type: "Share", # required, accepts Share
      #       }
      class DescribeDocumentPermissionRequest < Aws::Structure.new(
        :name,
        :permission_type)

        # @!attribute [rw] name
        #   The name of the document for which you are the owner.
        #   @return [String]

        # @!attribute [rw] permission_type
        #   The permission type for the document. The permission type can be
        #   *Share*.
        #   @return [String]

      end

      class DescribeDocumentPermissionResponse < Aws::Structure.new(
        :account_ids)

        # @!attribute [rw] account_ids
        #   The account IDs that have permission to use this document. The ID
        #   can be either an AWS account or *All*.
        #   @return [Array<String>]

      end

      # @note When making an API call, pass DescribeDocumentRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentARN", # required
      #       }
      class DescribeDocumentRequest < Aws::Structure.new(
        :name)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

      end

      class DescribeDocumentResult < Aws::Structure.new(
        :document)

        # @!attribute [rw] document
        #   Information about the SSM document.
        #   @return [Types::DocumentDescription]

      end

      # @note When making an API call, pass DescribeInstanceInformationRequest
      #   data as a hash:
      #
      #       {
      #         instance_information_filter_list: [
      #           {
      #             key: "InstanceIds", # required, accepts InstanceIds, AgentVersion, PingStatus, PlatformTypes
      #             value_set: ["InstanceInformationFilterValue"], # required
      #           },
      #         ],
      #         max_results: 1,
      #         next_token: "NextToken",
      #       }
      class DescribeInstanceInformationRequest < Aws::Structure.new(
        :instance_information_filter_list,
        :max_results,
        :next_token)

        # @!attribute [rw] instance_information_filter_list
        #   One or more filters. Use a filter to return a more specific list of
        #   instances.
        #   @return [Array<Types::InstanceInformationFilter>]

        # @!attribute [rw] max_results
        #   The maximum number of items to return for this call. The call also
        #   returns a token that you can specify in a subsequent call to get the
        #   next set of results.
        #   @return [Integer]

        # @!attribute [rw] next_token
        #   The token for the next set of items to return. (You received this
        #   token from a previous call.)
        #   @return [String]

      end

      class DescribeInstanceInformationResult < Aws::Structure.new(
        :instance_information_list,
        :next_token)

        # @!attribute [rw] instance_information_list
        #   The instance information list.
        #   @return [Array<Types::InstanceInformation>]

        # @!attribute [rw] next_token
        #   The token to use when requesting the next set of items. If there are
        #   no additional items to return, the string is empty.
        #   @return [String]

      end

      # Describes an SSM document.
      class DocumentDescription < Aws::Structure.new(
        :sha_1,
        :hash,
        :hash_type,
        :name,
        :owner,
        :created_date,
        :status,
        :description,
        :parameters,
        :platform_types)

        # @!attribute [rw] sha_1
        #   The SHA1 hash of the document, which you can use for verification
        #   purposes.
        #   @return [String]

        # @!attribute [rw] hash
        #   The Sha256 or Sha1 hash created by the system when the document was
        #   created.
        #
        #   <note markdown="1"> Sha1 hashes have been deprecated.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] hash_type
        #   Sha256 or Sha1.
        #
        #   <note markdown="1"> Sha1 hashes have been deprecated.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] owner
        #   The AWS user account of the person who created the document.
        #   @return [String]

        # @!attribute [rw] created_date
        #   The date when the SSM document was created.
        #   @return [Time]

        # @!attribute [rw] status
        #   The status of the SSM document.
        #   @return [String]

        # @!attribute [rw] description
        #   A description of the document.
        #   @return [String]

        # @!attribute [rw] parameters
        #   A description of the parameters for a document.
        #   @return [Array<Types::DocumentParameter>]

        # @!attribute [rw] platform_types
        #   The list of OS platforms compatible with this SSM document.
        #   @return [Array<String>]

      end

      # Describes a filter.
      # @note When making an API call, pass DocumentFilter
      #   data as a hash:
      #
      #       {
      #         key: "Name", # required, accepts Name, Owner, PlatformTypes
      #         value: "DocumentFilterValue", # required
      #       }
      class DocumentFilter < Aws::Structure.new(
        :key,
        :value)

        # @!attribute [rw] key
        #   The name of the filter.
        #   @return [String]

        # @!attribute [rw] value
        #   The value of the filter.
        #   @return [String]

      end

      # Describes the name of an SSM document.
      class DocumentIdentifier < Aws::Structure.new(
        :name,
        :owner,
        :platform_types)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] owner
        #   The AWS user account of the person who created the document.
        #   @return [String]

        # @!attribute [rw] platform_types
        #   The operating system platform.
        #   @return [Array<String>]

      end

      # Parameters specified in the SSM document that execute on the server
      # when the command is run.
      class DocumentParameter < Aws::Structure.new(
        :name,
        :type,
        :description,
        :default_value)

        # @!attribute [rw] name
        #   The name of the parameter.
        #   @return [String]

        # @!attribute [rw] type
        #   The type of parameter. The type can be either “String” or
        #   “StringList”.
        #   @return [String]

        # @!attribute [rw] description
        #   A description of what the parameter does, how to use it, the default
        #   value, and whether or not the parameter is optional.
        #   @return [String]

        # @!attribute [rw] default_value
        #   If specified, the default values for the parameters. Parameters
        #   without a default value are required. Parameters with a default
        #   value are optional.
        #   @return [String]

      end

      # Describes a failed association.
      class FailedCreateAssociation < Aws::Structure.new(
        :entry,
        :message,
        :fault)

        # @!attribute [rw] entry
        #   The association.
        #   @return [Types::CreateAssociationBatchRequestEntry]

        # @!attribute [rw] message
        #   A description of the failure.
        #   @return [String]

        # @!attribute [rw] fault
        #   The source of the failure.
        #   @return [String]

      end

      # @note When making an API call, pass GetDocumentRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentARN", # required
      #       }
      class GetDocumentRequest < Aws::Structure.new(
        :name)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

      end

      class GetDocumentResult < Aws::Structure.new(
        :name,
        :content)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] content
        #   The contents of the SSM document.
        #   @return [String]

      end

      # Describes a filter for a specific list of instances.
      class InstanceInformation < Aws::Structure.new(
        :instance_id,
        :ping_status,
        :last_ping_date_time,
        :agent_version,
        :is_latest_version,
        :platform_type,
        :platform_name,
        :platform_version)

        # @!attribute [rw] instance_id
        #   The instance ID.
        #   @return [String]

        # @!attribute [rw] ping_status
        #   Connection status of the SSM agent.
        #   @return [String]

        # @!attribute [rw] last_ping_date_time
        #   The date and time when agent last pinged SSM service.
        #   @return [Time]

        # @!attribute [rw] agent_version
        #   The version of the SSM agent running on your instance.
        #   @return [String]

        # @!attribute [rw] is_latest_version
        #   Indicates whether latest version of the SSM agent is running on your
        #   instance.
        #   @return [Boolean]

        # @!attribute [rw] platform_type
        #   The operating system platform type.
        #   @return [String]

        # @!attribute [rw] platform_name
        #   The name of the operating system platform running on your instance.
        #   @return [String]

        # @!attribute [rw] platform_version
        #   The version of the OS platform running on your instance.
        #   @return [String]

      end

      # Describes a filter for a specific list of instances.
      # @note When making an API call, pass InstanceInformationFilter
      #   data as a hash:
      #
      #       {
      #         key: "InstanceIds", # required, accepts InstanceIds, AgentVersion, PingStatus, PlatformTypes
      #         value_set: ["InstanceInformationFilterValue"], # required
      #       }
      class InstanceInformationFilter < Aws::Structure.new(
        :key,
        :value_set)

        # @!attribute [rw] key
        #   The name of the filter.
        #   @return [String]

        # @!attribute [rw] value_set
        #   The filter values.
        #   @return [Array<String>]

      end

      # @note When making an API call, pass ListAssociationsRequest
      #   data as a hash:
      #
      #       {
      #         association_filter_list: [ # required
      #           {
      #             key: "InstanceId", # required, accepts InstanceId, Name
      #             value: "AssociationFilterValue", # required
      #           },
      #         ],
      #         max_results: 1,
      #         next_token: "NextToken",
      #       }
      class ListAssociationsRequest < Aws::Structure.new(
        :association_filter_list,
        :max_results,
        :next_token)

        # @!attribute [rw] association_filter_list
        #   One or more filters. Use a filter to return a more specific list of
        #   results.
        #   @return [Array<Types::AssociationFilter>]

        # @!attribute [rw] max_results
        #   The maximum number of items to return for this call. The call also
        #   returns a token that you can specify in a subsequent call to get the
        #   next set of results.
        #   @return [Integer]

        # @!attribute [rw] next_token
        #   The token for the next set of items to return. (You received this
        #   token from a previous call.)
        #   @return [String]

      end

      class ListAssociationsResult < Aws::Structure.new(
        :associations,
        :next_token)

        # @!attribute [rw] associations
        #   The associations.
        #   @return [Array<Types::Association>]

        # @!attribute [rw] next_token
        #   The token to use when requesting the next set of items. If there are
        #   no additional items to return, the string is empty.
        #   @return [String]

      end

      # @note When making an API call, pass ListCommandInvocationsRequest
      #   data as a hash:
      #
      #       {
      #         command_id: "CommandId",
      #         instance_id: "InstanceId",
      #         max_results: 1,
      #         next_token: "NextToken",
      #         filters: [
      #           {
      #             key: "InvokedAfter", # required, accepts InvokedAfter, InvokedBefore, Status
      #             value: "CommandFilterValue", # required
      #           },
      #         ],
      #         details: false,
      #       }
      class ListCommandInvocationsRequest < Aws::Structure.new(
        :command_id,
        :instance_id,
        :max_results,
        :next_token,
        :filters,
        :details)

        # @!attribute [rw] command_id
        #   (Optional) The invocations for a specific command ID.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   (Optional) The command execution details for a specific instance ID.
        #   @return [String]

        # @!attribute [rw] max_results
        #   (Optional) The maximum number of items to return for this call. The
        #   call also returns a token that you can specify in a subsequent call
        #   to get the next set of results.
        #   @return [Integer]

        # @!attribute [rw] next_token
        #   (Optional) The token for the next set of items to return. (You
        #   received this token from a previous call.)
        #   @return [String]

        # @!attribute [rw] filters
        #   (Optional) One or more filters. Use a filter to return a more
        #   specific list of results.
        #   @return [Array<Types::CommandFilter>]

        # @!attribute [rw] details
        #   (Optional) If set this returns the response of the command
        #   executions and any command output. By default this is set to False.
        #   @return [Boolean]

      end

      class ListCommandInvocationsResult < Aws::Structure.new(
        :command_invocations,
        :next_token)

        # @!attribute [rw] command_invocations
        #   (Optional) A list of all invocations.
        #   @return [Array<Types::CommandInvocation>]

        # @!attribute [rw] next_token
        #   (Optional) The token for the next set of items to return. (You
        #   received this token from a previous call.)
        #   @return [String]

      end

      # @note When making an API call, pass ListCommandsRequest
      #   data as a hash:
      #
      #       {
      #         command_id: "CommandId",
      #         instance_id: "InstanceId",
      #         max_results: 1,
      #         next_token: "NextToken",
      #         filters: [
      #           {
      #             key: "InvokedAfter", # required, accepts InvokedAfter, InvokedBefore, Status
      #             value: "CommandFilterValue", # required
      #           },
      #         ],
      #       }
      class ListCommandsRequest < Aws::Structure.new(
        :command_id,
        :instance_id,
        :max_results,
        :next_token,
        :filters)

        # @!attribute [rw] command_id
        #   (Optional) If provided, lists only the specified command.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   (Optional) Lists commands issued against this instance ID.
        #   @return [String]

        # @!attribute [rw] max_results
        #   (Optional) The maximum number of items to return for this call. The
        #   call also returns a token that you can specify in a subsequent call
        #   to get the next set of results.
        #   @return [Integer]

        # @!attribute [rw] next_token
        #   (Optional) The token for the next set of items to return. (You
        #   received this token from a previous call.)
        #   @return [String]

        # @!attribute [rw] filters
        #   (Optional) One or more filters. Use a filter to return a more
        #   specific list of results.
        #   @return [Array<Types::CommandFilter>]

      end

      class ListCommandsResult < Aws::Structure.new(
        :commands,
        :next_token)

        # @!attribute [rw] commands
        #   (Optional) The list of commands requested by the user.
        #   @return [Array<Types::Command>]

        # @!attribute [rw] next_token
        #   (Optional) The token for the next set of items to return. (You
        #   received this token from a previous call.)
        #   @return [String]

      end

      # @note When making an API call, pass ListDocumentsRequest
      #   data as a hash:
      #
      #       {
      #         document_filter_list: [
      #           {
      #             key: "Name", # required, accepts Name, Owner, PlatformTypes
      #             value: "DocumentFilterValue", # required
      #           },
      #         ],
      #         max_results: 1,
      #         next_token: "NextToken",
      #       }
      class ListDocumentsRequest < Aws::Structure.new(
        :document_filter_list,
        :max_results,
        :next_token)

        # @!attribute [rw] document_filter_list
        #   One or more filters. Use a filter to return a more specific list of
        #   results.
        #   @return [Array<Types::DocumentFilter>]

        # @!attribute [rw] max_results
        #   The maximum number of items to return for this call. The call also
        #   returns a token that you can specify in a subsequent call to get the
        #   next set of results.
        #   @return [Integer]

        # @!attribute [rw] next_token
        #   The token for the next set of items to return. (You received this
        #   token from a previous call.)
        #   @return [String]

      end

      class ListDocumentsResult < Aws::Structure.new(
        :document_identifiers,
        :next_token)

        # @!attribute [rw] document_identifiers
        #   The names of the SSM documents.
        #   @return [Array<Types::DocumentIdentifier>]

        # @!attribute [rw] next_token
        #   The token to use when requesting the next set of items. If there are
        #   no additional items to return, the string is empty.
        #   @return [String]

      end

      # @note When making an API call, pass ModifyDocumentPermissionRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #         permission_type: "Share", # required, accepts Share
      #         account_ids_to_add: ["AccountId"],
      #         account_ids_to_remove: ["AccountId"],
      #       }
      class ModifyDocumentPermissionRequest < Aws::Structure.new(
        :name,
        :permission_type,
        :account_ids_to_add,
        :account_ids_to_remove)

        # @!attribute [rw] name
        #   The name of the document that you want to share.
        #   @return [String]

        # @!attribute [rw] permission_type
        #   The permission type for the document. The permission type can be
        #   *Share*.
        #   @return [String]

        # @!attribute [rw] account_ids_to_add
        #   The AWS user accounts that should have access to the document. The
        #   account IDs can either be a group of account IDs or *All*.
        #   @return [Array<String>]

        # @!attribute [rw] account_ids_to_remove
        #   The AWS user accounts that should no longer have access to the
        #   document. The AWS user account can either be a group of account IDs
        #   or *All*. This action has a higher priority than *AccountIdsToAdd*.
        #   If you specify an account ID to add and the same ID to remove, the
        #   system removes access to the document.
        #   @return [Array<String>]

      end

      class ModifyDocumentPermissionResponse < Aws::EmptyStructure; end

      # @note When making an API call, pass SendCommandRequest
      #   data as a hash:
      #
      #       {
      #         instance_ids: ["InstanceId"], # required
      #         document_name: "DocumentARN", # required
      #         document_hash: "DocumentHash",
      #         document_hash_type: "Sha256", # accepts Sha256, Sha1
      #         timeout_seconds: 1,
      #         comment: "Comment",
      #         parameters: {
      #           "ParameterName" => ["ParameterValue"],
      #         },
      #         output_s3_bucket_name: "S3BucketName",
      #         output_s3_key_prefix: "S3KeyPrefix",
      #       }
      class SendCommandRequest < Aws::Structure.new(
        :instance_ids,
        :document_name,
        :document_hash,
        :document_hash_type,
        :timeout_seconds,
        :comment,
        :parameters,
        :output_s3_bucket_name,
        :output_s3_key_prefix)

        # @!attribute [rw] instance_ids
        #   Required. The instance IDs where the command should execute.
        #   @return [Array<String>]

        # @!attribute [rw] document_name
        #   Required. The name of the SSM document to execute. This can be an
        #   SSM public document or a custom document.
        #   @return [String]

        # @!attribute [rw] document_hash
        #   The Sha256 or Sha1 hash created by the system when the document was
        #   created.
        #
        #   <note markdown="1"> Sha1 hashes have been deprecated.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] document_hash_type
        #   Sha256 or Sha1.
        #
        #   <note markdown="1"> Sha1 hashes have been deprecated.
        #
        #    </note>
        #   @return [String]

        # @!attribute [rw] timeout_seconds
        #   If this time is reached and the command has not already started
        #   executing, it will not execute.
        #   @return [Integer]

        # @!attribute [rw] comment
        #   User-specified information about the command, such as a brief
        #   description of what the command should do.
        #   @return [String]

        # @!attribute [rw] parameters
        #   The required and optional parameters specified in the SSM document
        #   being executed.
        #   @return [Hash<String,Array<String>>]

        # @!attribute [rw] output_s3_bucket_name
        #   The name of the S3 bucket where command execution responses should
        #   be stored.
        #   @return [String]

        # @!attribute [rw] output_s3_key_prefix
        #   The directory structure within the S3 bucket where the responses
        #   should be stored.
        #   @return [String]

      end

      class SendCommandResult < Aws::Structure.new(
        :command)

        # @!attribute [rw] command
        #   The request as it was received by SSM. Also provides the command ID
        #   which can be used future references to this request.
        #   @return [Types::Command]

      end

      # @note When making an API call, pass UpdateAssociationStatusRequest
      #   data as a hash:
      #
      #       {
      #         name: "DocumentName", # required
      #         instance_id: "InstanceId", # required
      #         association_status: { # required
      #           date: Time.now, # required
      #           name: "Pending", # required, accepts Pending, Success, Failed
      #           message: "StatusMessage", # required
      #           additional_info: "StatusAdditionalInfo",
      #         },
      #       }
      class UpdateAssociationStatusRequest < Aws::Structure.new(
        :name,
        :instance_id,
        :association_status)

        # @!attribute [rw] name
        #   The name of the SSM document.
        #   @return [String]

        # @!attribute [rw] instance_id
        #   The ID of the instance.
        #   @return [String]

        # @!attribute [rw] association_status
        #   The association status.
        #   @return [Types::AssociationStatus]

      end

      class UpdateAssociationStatusResult < Aws::Structure.new(
        :association_description)

        # @!attribute [rw] association_description
        #   Information about the association.
        #   @return [Types::AssociationDescription]

      end

    end
  end
end