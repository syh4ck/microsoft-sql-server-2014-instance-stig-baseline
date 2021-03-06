control 'V-67837' do
  title "SQL Server must have the Master Data Services software component
  removed if it is unused."
  desc "Information systems are capable of providing a wide variety of
  functions and services. Some of the functions and services, provided by default
  or selected for installation by an administrator, may not be necessary to
  support essential organizational operations (e.g., key missions, functions).

      Applications must adhere to the principles of least functionality by
  providing only essential capabilities.  Unused and unnecessary SQL Server
  components increase the number of available attack vectors.  By minimizing the
  services and applications installed on the system, the number of potential
  vulnerabilities is reduced.

      The Master Data Services software component must be removed from SQL Server
  if it is unused.
  "
  impact 0.5
  tag "gtitle": 'SRG-APP-000141-DB-000091'
  tag "gid": 'V-67837'
  tag "rid": 'SV-82327r1_rule'
  tag "stig_id": 'SQL4-00-016820'
  tag "fix_id": 'F-73953r1_fix'
  tag "cci": ['CCI-000381']
  tag "nist": ['CM-7 a', 'Rev_4']
  tag "false_negatives": nil
  tag "false_positives": nil
  tag "documentable": false
  tag "mitigations": nil
  tag "severity_override_guidance": false
  tag "potential_impacts": nil
  tag "third_party_tools": nil
  tag "mitigation_controls": nil
  tag "responsibility": nil
  tag "ia_controls": nil
  tag "check": "If the Master Data Services feature is used and satisfies
  organizational requirements, this is not a finding.

  Click on the Start button.  Navigate to >> Microsoft SQL Server 2014 >> Master
  Data Services.

  If the \"Master Data Services\" folder exists and contains any programs, this
  is a finding.

  In Windows Explorer, navigate to <drive where SQL Server is
  installed>:\\Program Files\\Microsoft SQL Server\\120\\Master Data Services\\.

  If this exists and contains any files, this is a finding."
  tag "fix": "Either using the Start menu or via the command \"control.exe\",
  open the Windows Control Panel.  Open Programs and Features.  Double-click on
  Microsoft SQL Server 2014.  In the dialog box that appears, select Remove.
  Wait for the Remove wizard to appear.

  Select '<< Remove shared features only >>'; click Next.  Note: all SQL Server
  2014 instances will be affected by this action.)

  Select Master Data Services; click Next.

  Follow the remaining prompts, to remove Master Data Services from SQL Server."

  master_data_services_used = attribute('master_data_services_used')
  describe.one do
    describe 'Master Data Services is in use' do
      subject { master_data_services_used }
      it { should be true }
    end

    describe directory('C:\\Program Files\\Microsoft SQL Server\\120\\Master Data Services') do
      it { should_not exist }
    end
  end
end
