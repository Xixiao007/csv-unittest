@isTest
public with sharing class AccountTest {
  private static List<SObject> accounts;

  @TestSetup
  static void loadTestDataFromStaticResource(){
    accounts = Test.loadData(Account.getSObjectType(), 'testApp');
  }

  @isTest
  static void testAccount(){
    System.assertEquals(3, accounts.size(), 'test data inserted size 3 account records.');
  }
}
