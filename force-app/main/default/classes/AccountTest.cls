@isTest
public with sharing class AccountTest {
  private static List<Account> accounts = [SELECT Id, Name FROM Account];

  @TestSetup
  static void loadTestDataFromStaticResource(){
    accounts = Test.loadData(Account.sObjectType, 'testAccounts');
    System.assert(accounts.size() == 3);
  }

  @isTest
  static void testAccount(){

        System.assertEquals(3, accounts.size(), 'test data inserted size 3 account records.');
        System.assertEquals('sForceTest1', accounts[0].Name, 'first test account record name not match.');
  }
}
