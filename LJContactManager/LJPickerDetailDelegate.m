//
//  LJPickerDetailDelegate.m
//  Demo
//
//  Created by LeeJay on 2017/4/24.
//  Copyright © 2017年 LeeJay. All rights reserved.
//

#import "LJPickerDetailDelegate.h"

@implementation LJPickerDetailDelegate 

#pragma mark - ABPeoplePickerNavigationControllerDelegate

- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker
                         didSelectPerson:(ABRecordRef)person
                                property:(ABPropertyID)property
                              identifier:(ABMultiValueIdentifier)identifier
{

    NSLog(@"%s",__func__);
    NSString *name = CFBridgingRelease(ABRecordCopyCompositeName(person));
    
    ABMultiValueRef multi = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(multi, identifier);
    NSString *phone = CFBridgingRelease(ABMultiValueCopyValueAtIndex(multi, index));
    CFRelease(multi);
    
    if (self.handler)
    {
        self.handler(name, phone);
    }
    
    [peoplePicker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CNContactPickerDelegate

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    NSLog(@"%s",__func__);

    CNContact *contact = contactProperty.contact;
    NSString *name = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
    CNPhoneNumber *phoneValue= contactProperty.value;
    NSString *phoneNumber = phoneValue.stringValue;
    
    if (self.handler)
    {
        self.handler(name, phoneNumber);
    }
}
-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact{

    NSLog(@"%s",__func__);

    NSLog(@"%@",contact);

    if (contact.phoneNumbers.count==1) {

        NSString *name = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
        CNPhoneNumber *phoneValue= contact.phoneNumbers[0].value;
        NSString *phoneNumber = phoneValue.stringValue;

        if (self.handler)
        {
            self.handler(name, phoneNumber);
        }

        [picker dismissViewControllerAnimated:YES completion:nil];


    }else{


        [picker dismissViewControllerAnimated:NO completion:nil];

        CNContactViewController *contactController = [CNContactViewController viewControllerForContact:contact];

        contactController.displayedPropertyKeys = @[CNContactPhoneNumbersKey];

        contactController.delegate = self;
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:contactController];
//        [picker presentViewController:nav animated:YES completion:nil];

//

        if (self.controller.navigationController) {
            [self.controller.navigationController pushViewController:contactController animated:YES];

        }else{
            [self.controller presentViewController:nav animated:YES completion:nil];
        }
    }

}


- (BOOL)contactViewController:(CNContactViewController *)viewController shouldPerformDefaultActionForContactProperty:(CNContactProperty *)property{


    NSLog(@"%s",__func__);

    CNContact *contact = property.contact;
    NSString *name = [CNContactFormatter stringFromContact:contact style:CNContactFormatterStyleFullName];
    CNPhoneNumber *phoneValue= property.value;
    NSString *phoneNumber = phoneValue.stringValue;

    if (self.handler)
    {
        self.handler(name, phoneNumber);
    }
    if (self.controller.navigationController) {
        [self.controller.navigationController popViewControllerAnimated:YES];

    }else{
        [self.controller dismissViewControllerAnimated:YES completion:nil];
    }
    return NO;
}

/*!
 * @abstract    Called when the view has completed.
 * @discussion  If creating a new contact, the new contact added to the contacts list will be passed.
 *              If adding to an existing contact, the existing contact will be passed.
 * @note        It is up to the delegate to dismiss the view controller.
 */
- (void)contactViewController:(CNContactViewController *)viewController didCompleteWithContact:(nullable CNContact *)contact{
    NSLog(@"%s",__func__);

}

//-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContacts:(NSArray<CNContact *> *)contacts{
//    NSLog(@"%@",contacts);//这是选多人的。
//
//}
//-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperties:(NSArray<CNContactProperty *> *)contactProperties{
//    NSLog(@"%@",contactProperties);//这也是选多人的。
//}

@end
