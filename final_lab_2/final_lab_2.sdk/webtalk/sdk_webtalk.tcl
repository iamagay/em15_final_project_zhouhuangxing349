webtalk_init -webtalk_dir E:\\class\\Project\\final_lab_2\\final_lab_2.sdk\\webtalk
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "���ڶ� ���� 23 11:47:07 2015" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "SDK v2014.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2014.4" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "amd64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "SDK" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "false" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "NA" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "r0ftik7akjba19btcu13siid81" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "2014.4_10" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "10" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "" -context "user_environment"
webtalk_add_data -client project -key os_release -value "" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "" -context "user_environment"
webtalk_register_client -client sdk
webtalk_add_data -client sdk -key uid -value "1435030567245" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key isZynq -value "true" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key Processors -value "2" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key VivadoVersion -value "2014.4" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key Arch -value "zynq" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key Device -value "7z010" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key IsHandoff -value "true" -context "sdk\\\\hardware/1435030567245"
webtalk_add_data -client sdk -key uid -value "1435030611218" -context "sdk\\\\bsp/1435030611218"
webtalk_add_data -client sdk -key hwid -value "1435030567245" -context "sdk\\\\bsp/1435030611218"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\bsp/1435030611218"
webtalk_add_data -client sdk -key apptemplate -value "null" -context "sdk\\\\bsp/1435030611218"
webtalk_add_data -client sdk -key uid -value "1435030776256" -context "sdk\\\\application/1435030776256"
webtalk_add_data -client sdk -key hwid -value "1435030567245" -context "sdk\\\\application/1435030776256"
webtalk_add_data -client sdk -key bspid -value "1435030611218" -context "sdk\\\\application/1435030776256"
webtalk_add_data -client sdk -key newbsp -value "false" -context "sdk\\\\application/1435030776256"
webtalk_add_data -client sdk -key os -value "standalone" -context "sdk\\\\application/1435030776256"
webtalk_add_data -client sdk -key apptemplate -value "empty_application" -context "sdk\\\\application/1435030776256"
webtalk_transmit -clientid 410182641 -regid "" -xml E:\\class\\Project\\final_lab_2\\final_lab_2.sdk\\webtalk\\usage_statistics_ext_sdk.xml -html E:\\class\\Project\\final_lab_2\\final_lab_2.sdk\\webtalk\\usage_statistics_ext_sdk.html -wdm E:\\class\\Project\\final_lab_2\\final_lab_2.sdk\\webtalk\\sdk_webtalk.wdm -intro "<H3>SDK Usage Report</H3><BR>"
webtalk_terminate
