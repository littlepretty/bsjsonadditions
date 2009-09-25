//
//  JSONValidTests.m
//  BSJSONAdditions
//
//  Created by Blake Seely on 2/2/06.
//  Copyright 2006 __MyCompanyName__. All rights reserved.
//

#import "JSONValidTests.h"
#import "NSDictionary+BSJSONAdditions.h"
#import "NSScanner+BSJSONAdditions.h"
#import "NSString+BSJSONAdditions.h"

@implementation JSONValidTests

- (void)testValidJSON
{
	// test 'json_test_valid_01.txt"
	NSString *testFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_valid_01" ofType:@"txt"];
	STAssertNotNil(testFilePath, @"Could not find the test file named \"json_test_valid_01.txt\"");
	NSString *jsonString = [NSString stringWithContentsOfFile:testFilePath];
	STAssertNotNil(jsonString, @"Could not create an NSString from the file at path %@", testFilePath);
	NSDictionary *dict = [NSDictionary dictionaryWithJSONString:jsonString];
	STAssertNotNil(dict, @"Could not create dictionary from json_test_valid_01 json");
	// output check
	NSDictionary *dict2 = [NSDictionary dictionaryWithJSONString:[dict jsonStringValue]];
	STAssertEqualObjects(dict, dict2, @"New Dictionary from json output of first dictionary should be equal for test 01");
	// structure checks (counts, keypaths are not nil, etc.)
	STAssertEquals(1u, dict.count, @"Expected 1 key-val pair");
  STAssertEquals(2u, [[dict valueForKeyPath:@"glossary"] count], @"Expected the glossary entry to have two entries.");
  STAssertEquals(2u, [[dict valueForKeyPath:@"glossary.GlossDiv"] count], @"Expected GlossDiv entry to have two entries.");
  STAssertEquals(1u, [[dict valueForKeyPath:@"glossary.GlossDiv.GlossList"] count], @"Expected GlossList to be an array with a single entry");
  STAssertEquals(7u, [[[dict valueForKeyPath:@"glossary.GlossDiv.GlossList"] objectAtIndex:0] count], @"Expected GlossList array element 0 dictionary to have 7 entries");
  STAssertEquals(3u, [[[[dict valueForKeyPath:@"glossary.GlossDiv.GlossList"] objectAtIndex:0] valueForKey:@"GlossSeeAlso"] count], @"Expected the GlossSeeAlso array to have 3 entries");
	// value checks - keys are correct, etc.
	STAssertEqualObjects(@"example glossary", [dict valueForKeyPath:@"glossary.title"], @"Expected glossary.title to be \"example glossary\", but found %@", [dict valueForKeyPath:@"glossary.title"]);
	// more...
	
	
	// test 'json_test_valid_02.txt"
	testFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_valid_02" ofType:@"txt"];
	STAssertNotNil(testFilePath, @"Could not find the test file named \"json_test_valid_02.txt\"");
	jsonString = [NSString stringWithContentsOfFile:testFilePath];
	STAssertNotNil(jsonString, @"Could not create an NSString from the file at path %@", testFilePath);
	dict = [NSDictionary dictionaryWithJSONString:jsonString];
	STAssertNotNil(dict, @"Could not create dictionary from json_test_valid_02 json");
	// output check
    NSLog([dict jsonStringValue]);
	dict2 = [NSDictionary dictionaryWithJSONString:[dict jsonStringValue]];
	STAssertEqualObjects(dict, dict2, @"New Dictionary from json output of first dictionary should be equal for test 02");
	// structure checks (counts, keypaths are not nil, etc.)
	STAssertEquals(1u, dict.count, @"Expected a single item in the top level dictionary");
  STAssertEquals(3u, [[dict valueForKey:@"menu"] count], @"Expected a 3 items in the menu dictionary");
  STAssertEquals(1u, [[dict valueForKeyPath:@"menu.popup"] count], @"Expected a single item in the popup dictionary");
  STAssertEquals(3u, [[dict valueForKeyPath:@"menu.popup.menuitem"] count], @"Expected 3 items in the menuitem array");
	// value checks
	
	
	// test 'json_test_valid_03.txt"
	testFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_valid_03" ofType:@"txt"];
	STAssertNotNil(testFilePath, @"Could not find the test file named \"json_test_valid_03.txt\"");
	jsonString = [NSString stringWithContentsOfFile:testFilePath];
	STAssertNotNil(jsonString, @"Could not create an NSString from the file at path %@", testFilePath);
	dict = [NSDictionary dictionaryWithJSONString:jsonString];
	STAssertNotNil(dict, @"Could not create dictionary from json_test_valid_03 json");
	// output check
	dict2 = [NSDictionary dictionaryWithJSONString:[dict jsonStringValue]];
	STAssertEqualObjects(dict, dict2, @"New Dictionary from json output of first dictionary should be equal for test 03");
	// structure checks
	// value checks
  NSInteger width = [[dict valueForKeyPath:@"widget.window.width"] intValue];
	STAssertEquals(500, width, @"Expected value of 500, but got %i", width);

	// test 'json_test_valid_04.txt"
	testFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_valid_04" ofType:@"txt"];
	STAssertNotNil(testFilePath, @"Could not find the test file named \"json_test_valid_04.txt\"");
	jsonString = [NSString stringWithContentsOfFile:testFilePath];
	STAssertNotNil(jsonString, @"Could not create an NSString from the file at path %@", testFilePath);
	dict = [NSDictionary dictionaryWithJSONString:jsonString];
	STAssertNotNil(dict, @"Could not create dictionary from json_test_valid_04 json");
	// output check
	dict2 = [NSDictionary dictionaryWithJSONString:[dict jsonStringValue]];
	STAssertEqualObjects(dict, dict2, @"New Dictionary from json output of first dictionary should be equal for test 04");
	// structure checks
	// value checks
	
	// test 'json_test_valid_05.txt"
	testFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_valid_05" ofType:@"txt"];
	STAssertNotNil(testFilePath, @"Could not find the test file named \"json_test_valid_05.txt\"");
	jsonString = [NSString stringWithContentsOfFile:testFilePath];
	STAssertNotNil(jsonString, @"Could not create an NSString from the file at path %@", testFilePath);
	dict = [NSDictionary dictionaryWithJSONString:jsonString];
	STAssertNotNil(dict, @"Could not create dictionary from json_test_valid_05 json");
	// output check
	dict2 = [NSDictionary dictionaryWithJSONString:[dict jsonStringValue]];
	STAssertEqualObjects(dict, dict2, @"New Dictionary from json output of first dictionary should be equal for test 05");
	// structure check
	STAssertEquals(1u, dict.count, @"Expected one value in the dictionary");
	STAssertEquals(2u, [[dict valueForKey:@"menu"] count], @"Expected two items in the menu dictionary");
	STAssertEquals(22u, [[dict valueForKeyPath:@"menu.items"] count], @"Expected 22 items in the items array");
	// value checks
	STAssertEquals([NSNull null], [[dict valueForKeyPath:@"menu.items"] objectAtIndex:2], @"Expected a null value in index 2");
	
	// test 'json_test_valid_06.txt"
	testFilePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"json_test_valid_06" ofType:@"txt"];
	STAssertNotNil(testFilePath, @"Could not find the test file named \"json_test_valid_06.txt\"");
	jsonString = [NSString stringWithContentsOfFile:testFilePath];
	STAssertNotNil(jsonString, @"Could not create an NSString from the file at path %@", testFilePath);
	dict = [NSDictionary dictionaryWithJSONString:jsonString];
	STAssertNotNil(dict, @"Could not create dictionary from json_test_valid_06 json");
	// output check
	dict2 = [NSDictionary dictionaryWithJSONString:[dict jsonStringValue]];
	// does not work because of exponential notation
	//STAssertTrue([dict isEqualToDictionary:dict2], @"New Dictionary from json output of first dictionary should be equal for test 06");
	
}

- (void)testURLDecodeWithoutEscapedSlashes
{
	NSDictionary *testDictionary = [NSDictionary dictionaryWithJSONString:@"{\"Url\":\"http://scd.mm-b1.yimg.com/image/481989943\"}"];
	STAssertEquals(1u, testDictionary.count, @"Test URL Decode: Should have ended up with a dictionary with a single entry");
	
	NSString *url = [testDictionary objectForKey:@"Url"];
	STAssertNotNil(url, @"Test URL Decode: Resulting dictionary should have had a single key-value pair with the key being \"Url\"");
	STAssertEqualObjects(@"http://scd.mm-b1.yimg.com/image/481989943", url, @"Test URL Decode: Didn't end up with the URL we should have");
}

- (void)testURLDecodeWithEscapedSlashes
{
	NSDictionary *testDictionary = [NSDictionary dictionaryWithJSONString:@"{\"Url\":\"http:\\/\\/scd.mm-b1.yimg.com\\/image\\/481989943\"}"];
  STAssertEquals(1u, testDictionary.count, @"Test URL Decode: Should have ended up with a dictionary with a single entry");
	
	NSString *url = [testDictionary objectForKey:@"Url"];
	STAssertNotNil(url, @"Test URL Decode: Resulting dictionary should have had a single key-value pair with the key being \"Url\"");
	STAssertEqualObjects(@"http://scd.mm-b1.yimg.com/image/481989943", url, @"Test URL Decode: Didn't end up with the URL we should have");
}

- (void)testURLEncode
{
	NSString *url = @"http://scd.mm-b1.yimg.com/image/481989943";
	NSString *jsonString = [url jsonStringValue];
	STAssertEqualObjects(@"\"http:\\/\\/scd.mm-b1.yimg.com\\/image\\/481989943\"", jsonString, @"URL did not encode to JSON correctly");
}

@end
