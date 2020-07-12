import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zaha/I10n/messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
    locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  // list of locales
  String get heyWorld {
    return Intl.message(
      'Hey World',
      name: 'heyWorld',
      desc: 'Simple word for greeting ',
    );
  }
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: 'user login ',
    );
  }
  String get signIn {
    return Intl.message(
      'sign in',
      name: 'signIn',
      desc: 'sign in',
    );
  }
  String get socialLogin {
    return Intl.message(
      'Social Login',
      name: 'socialLogin',
      desc: 'Social Login',
    );
  }
  String get newUser {
    return Intl.message(
      'New User?',
      name: 'newUser',
      desc: 'New User?',
    );
  }
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: 'Sign Up',
    );
  }
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: 'User Name',
    );
  }
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: 'Password',
    );
  }
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: 'Forgot Password',
    );
  }
  String get featuredProduct {
    return Intl.message(
      'Featured Product',
      name: 'featuredProduct',
      desc: 'Featured Product',
    );
  }
  String get featuredCompany {
    return Intl.message(
      'Featured Company',
      name: 'featuredCompany',
      desc: 'Featured Company',
    );
  }
  String get categories {
    return Intl.message(
      'Categories',
      name: 'categories',
      desc: 'Categories',
    );
  }
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: 'See All',
    );
  }
  String get favoriteCompanies {
    return Intl.message(
      'Favorite Companies',
      name: 'favoriteCompanies',
      desc: 'Favorite Companies',
    );
  }
  String get favoriteCompaniesDescription {
    return Intl.message(
      'Favorite Companies Description',
      name: 'favoriteCompaniesDescription',
      desc: 'Here is your favorite companies list',
    );
  }
  String get favoriteAdvertisement {
    return Intl.message(
      'Favorite Advertisement',
      name: 'favoriteAdvertisement',
      desc: 'Favorite Advertisement',
    );
  }
  String get favoriteAdvertisementDescription {
    return Intl.message(
      'Favorite Advertisement Description',
      name: 'favoriteAdvertisementDescription',
      desc: 'Here is your favorite advertisement list',
    );
  }
  String get favorite {
    return Intl.message(
      'Favorite',
      name: 'favorite',
      desc: 'Favorite',
    );
  }
  String get similarCompanies {
    return Intl.message(
      'Similar Companies',
      name: 'similarCompanies',
      desc: 'Similar Companies',
    );
  }
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: 'Location',
    );
  }
  String get distance {
    return Intl.message(
      '1.4 KM',
      name: 'distance',
      desc: '1.4 KM',
    );
  }
  String get time {
    return Intl.message(
      '15 min',
      name: 'time',
      desc: '15 min',
    );
  }
  String get locationDescription {
    return Intl.message(
      'Great place for a picnic',
      name: 'locationDescription',
      desc: 'Great place for a picnic',
    );
  }
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: 'Name',
    );
  }
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: 'Email',
    );
  }
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: 'Mobile',
    );
  }
  String get address {
    return Intl.message(
      'Address',
      name: 'address',
      desc: 'Address',
    );
  }
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: 'Register',
    );
  }
  String get facebookAccount {
    return Intl.message(
      'Facebook Account',
      name: 'facebookAccount',
      desc: 'Facebook Account',
    );
  }
  String get twitterAccount {
    return Intl.message(
      'Twitter Account',
      name: 'twitterAccount',
      desc: 'Twitter Account',
    );
  }
  String get linkedInAccount {
    return Intl.message(
      'LinkedIn Account',
      name: 'linkedInAccount',
      desc: 'LinkedIn Account',
    );
  }
  String get data {
    return Intl.message(
      'Data',
      name: 'data',
      desc: 'Data',
    );
  }
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: 'Search',
    );
  }
  String get companies {
    return Intl.message(
      'Companies',
      name: 'companies',
      desc: 'Companies',
    );
  }
  String get category {
    return Intl.message(
      'Category',
      name: 'category',
      desc: 'Category',
    );
  }
  String get products {
    return Intl.message(
      'Products',
      name: 'products',
      desc: 'Products',
    );
  }
  String get haveAnAccount {
    return Intl.message(
      'Have an account?',
      name: 'haveAnAccount',
      desc: 'Have an account?',
    );
  }
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: 'Reset Password',
    );
  }
  String get rememberPassword {
    return Intl.message(
      'Remember Password?',
      name: 'rememberPassword',
      desc: 'Remember Password?',
    );
  }
  String get submit {
    return Intl.message(
      'Submit',
      name: 'submit',
      desc: 'Submit',
    );
  }
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: 'Description',
    );
  }
  String get contactInformation {
    return Intl.message(
      'Contact Information',
      name: 'contactInformation',
      desc: 'Contact Information',
    );
  }
  String get subCategories {
    return Intl.message(
      'Sub Categories',
      name: 'subCategories',
      desc: 'Sub Categories',
    );
  }
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: 'First Name',
    );
  }
}
