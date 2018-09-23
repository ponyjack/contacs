from django.db import models
from django.conf import settings
from django.utils.translation import ugettext as _
from django.utils.encoding import python_2_unicode_compatible
from django_comments.models import Comment
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericRelation, GenericForeignKey

from .managers import SpecialDateManager

import logging

logger = logging.getLogger(__name__)


@python_2_unicode_compatible
class Person(models.Model):
    """Person model."""

    first_name = models.CharField(_("first name"), max_length=100)
    last_name = models.CharField(_("last name"), max_length=200)
    middle_name = models.CharField(
        _("middle name"), max_length=200, blank=True, null=True
    )
    suffix = models.CharField(_("suffix"), max_length=50, blank=True, null=True)
    nickname = models.CharField(_("nickname"), max_length=100, blank=True)
    title = models.CharField(_("title"), max_length=200, blank=True)

    about = models.TextField(_("about"), blank=True)
    photo = models.ImageField(_("photo"), upload_to="contacts/person/", blank=True)

    user = models.OneToOneField(
        settings.AUTH_USER_MODEL,
        blank=True,
        null=True,
        verbose_name=_("user"),
        on_delete=models.CASCADE,
    )

    phone_number = GenericRelation("PhoneNumber")
    email_address = GenericRelation("EmailAddress")
    instant_messenger = GenericRelation("InstantMessenger")
    web_site = GenericRelation("WebSite")
    street_address = GenericRelation("StreetAddress")
    special_date = GenericRelation("SpecialDate")
    note = GenericRelation(Comment, object_id_field="object_pk")

    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    class Meta:
        db_table = "contacts_people"
        ordering = ("last_name", "first_name")
        verbose_name = _("person")
        verbose_name_plural = _("people")

    def __str__(self):
        return self.fullname

    @property
    def fullname(self):
        return "%s %s" % (self.first_name, self.last_name)


@python_2_unicode_compatible
class Group(models.Model):
    """Group model."""

    name = models.CharField(_("name"), max_length=200)
    slug = models.SlugField(_("slug"), max_length=50, unique=True)
    about = models.TextField(_("about"), blank=True)

    people = models.ManyToManyField(Person, verbose_name="people", blank=True)

    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    class Meta:
        db_table = "contacts_groups"
        ordering = ("name",)
        verbose_name = _("group")
        verbose_name_plural = _("groups")

    def __str__(self):
        return "%s" % self.name


@python_2_unicode_compatible
class PhoneNumber(models.Model):

    name = models.CharField(_("name"), max_length=200)
    phone_number = models.CharField(_("number"), max_length=50)
    person = models.ForeignKey(
        Person, blank=True, null=True, on_delete=models.CASCADE, related_name="phones"
    )
    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    def __str__(self):
        return "%s (%s)" % (self.phone_number, self.name)

    class Meta:
        db_table = "contacts_phone_numbers"
        verbose_name = _("phone number")
        verbose_name_plural = _("phone numbers")


@python_2_unicode_compatible
class EmailAddress(models.Model):
    name = models.CharField(_("name"), max_length=200)

    email_address = models.EmailField(_("email address"))
    person = models.ForeignKey(
        Person, blank=True, null=True, on_delete=models.CASCADE, related_name="emails"
    )
    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    def __str__(self):
        return "%s (%s)" % (self.email_address, self.name)

    class Meta:
        db_table = "contacts_email_addresses"
        verbose_name = _("email address")
        verbose_name_plural = _("email addresses")


@python_2_unicode_compatible
class InstantMessenger(models.Model):
    OTHER = "other"

    IM_SERVICE_CHOICES = (
        ("aim", _("AIM")),
        ("msn", _("MSN")),
        ("icq", _("ICQ")),
        ("jabber", _("Jabber")),
        ("yahoo", _("Yahoo")),
        ("skype", _("Skype")),
        ("qq", _("QQ")),
        ("sametime", _("Sametime")),
        ("gadu-gadu", _("Gadu-Gadu")),
        ("google-talk", _("Google Talk")),
        (OTHER, _("Other")),
    )

    im_account = models.CharField(_("im account"), max_length=100)
    name = models.CharField(_("name"), max_length=200)

    service = models.CharField(
        _("service"), max_length=11, choices=IM_SERVICE_CHOICES, default=OTHER
    )
    person = models.ForeignKey(
        Person, blank=True, null=True, on_delete=models.CASCADE, related_name="ims"
    )
    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    def __str__(self):
        return "%s (%s)" % (self.im_account, self.name)

    class Meta:
        db_table = "contacts_instant_messengers"
        verbose_name = _("instant messenger")
        verbose_name_plural = _("instant messengers")


@python_2_unicode_compatible
class WebSite(models.Model):

    url = models.URLField(_("URL"))
    name = models.CharField(_("name"), max_length=200)
    person = models.ForeignKey(
        Person, blank=True, null=True, on_delete=models.CASCADE, related_name="websites"
    )
    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    def __str__(self):
        return "%s (%s)" % (self.url, self.name)

    class Meta:
        db_table = "contacts_web_sites"
        verbose_name = _("web site")
        verbose_name_plural = _("web sites")


@python_2_unicode_compatible
class StreetAddress(models.Model):

    street = models.TextField(_("street"), blank=True)
    city = models.CharField(_("city"), max_length=200, blank=True)
    province = models.CharField(_("province"), max_length=200, blank=True)
    postal_code = models.CharField(_("postal code"), max_length=10, blank=True)
    country = models.CharField(_("country"), max_length=100)
    name = models.CharField(_("name"), max_length=200)
    person = models.ForeignKey(
        Person, on_delete=models.CASCADE, related_name="addresss"
    )

    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    def __str__(self):
        return "%s (%s)" % (self.city, self.name)

    class Meta:
        db_table = "contacts_street_addresses"
        verbose_name = _("street address")
        verbose_name_plural = _("street addresses")


@python_2_unicode_compatible
class SpecialDate(models.Model):
    person = models.ForeignKey(
        Person, on_delete=models.CASCADE, related_name="specialdates"
    )

    occasion = models.TextField(_("occasion"), max_length=200)
    date = models.DateField(_("date"))
    every_year = models.BooleanField(_("every year"), default=True)

    date_added = models.DateTimeField(_("date added"), auto_now_add=True)
    date_modified = models.DateTimeField(_("date modified"), auto_now=True)

    objects = SpecialDateManager()

    def __str__(self):
        return "%s: %s" % (self.occasion, self.date)

    class Meta:
        db_table = "contacts_special_dates"
        verbose_name = _("special date")
        verbose_name_plural = _("special dates")

