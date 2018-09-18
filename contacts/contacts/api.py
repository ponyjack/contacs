from rest_framework import routers, serializers, viewsets
from .models import Person, Company, PhoneNumber
import logging

logger = logging.getLogger(__name__)
# Serializers define the API representation.


class PhoneNumberObjectRelatedField(serializers.RelatedField):
    """
    A custom field to use for the `tagged_object` generic relationship.
    """

    def to_representation(self, value):
        """
        Serialize tagged objects to a simple textual representation.
        """
        if isinstance(value, Company):
            serializer = CompanySerializer(value)
        elif isinstance(value, Person):
            serializer = PersonSerializer(value)
        return serializer.data


class PersonSerializer(serializers.ModelSerializer):
    #

    class Meta:
        model = Person
        exclude = ()

    def create(self, validated_data):
        logger.info(validated_data)
        persons = validated_data.pop("phone_number", None)
        logger.info(persons)
        company = Company.objects.create(**validated_data)

        if persons:
            for v in persons:
                p, created = Person.objects.get_or_create(company=company, **v)
                logger.info(created)
        return company


class PersonViewSet(viewsets.ModelViewSet):
    queryset = Person.objects.all()
    serializer_class = PersonSerializer


class CompanySerializer(serializers.ModelSerializer):
    persons = PersonSerializer(many=True, read_only=True)

    class Meta:
        model = Company
        exclude = ()

    def create(self, validated_data):
        logger.info(validated_data)
        persons = validated_data.pop("persons", None)
        logger.info(persons)
        company = Company.objects.create(**validated_data)

        if persons:
            for v in persons:
                p, created = Person.objects.get_or_create(company=company, **v)
                logger.info(created)
        return company


class CompanyViewSet(viewsets.ModelViewSet):
    queryset = Company.objects.all()
    serializer_class = CompanySerializer


# Routers provide an easy way of automatically determining the URL conf.
router = routers.DefaultRouter()
router.register(r"person", PersonViewSet)
router.register(r"company", CompanyViewSet)

