# @TEST-DOC: Very basic testing of errors for non-existing groups.
# @TEST-EXEC: zeek %INPUT > output 2>&1
# @TEST-EXEC: TEST_DIFF_CANONIFIER=$SCRIPTS/diff-remove-abspath btest-diff output
event zeek_init()
	{
	local r = enable_event_group("my-group");
	print "enable nonexistent event group", r;
	}

@TEST-START-NEXT
event zeek_init()
	{
	local r = disable_event_group("my-group");
	print "disable nonexistent event group", r;
	}

@TEST-START-NEXT
event zeek_init()
	{
	local r = enable_module_events("MyModule");
	print "enabling nonexistent module event group", r;
	}

@TEST-START-NEXT
event zeek_init()
	{
	local r = disable_module_events("MyModule");
	print "disable nonexistent module event group", r;
	}
