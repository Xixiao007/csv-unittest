@isTest
public with sharing class AccountTest {
  private static List<Account> accounts = [SELECT Id, Name, (SELECT Id, FirstName FROM Contacts ORDER BY Id) FROM Account ORDER BY Id];
  private static List<Contact> contacts = [SELECT Id, FirstName FROM Contact ORDER BY Id];

  @TestSetup
  static void loadTestDataFromStaticResource(){
    accounts = Test.loadData(Account.sObjectType, 'testAccounts');
    contacts = Test.loadData(Contact.sObjectType, 'testContacts');
    System.assert(accounts.size() == 3);
    System.assert(contacts.size() == 3);
  }

  @isTest
  static void testAccount(){

        System.assertEquals(3, accounts.size(), 'test data inserted size 3 account records.');
        System.assertEquals('sForceTest1', accounts[0].Name, 'first test account record name not match.');
        System.assertEquals('1firstname', accounts[0].Contacts[0].firstName, 'first test account record name not match.');

        System.assertEquals(3, contacts.size(), 'test data inserted size 3 contact records.');
        System.assertEquals('1firstname', contacts[0].FirstName, 'not match');
  }
}
