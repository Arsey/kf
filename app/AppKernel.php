<?php

use Symfony\Component\HttpKernel\Kernel;
use Symfony\Component\Config\Loader\LoaderInterface;

class AppKernel extends Kernel
{
    public function registerBundles()
    {
    	
    	  $bundles = array(
            new Symfony\Bundle\FrameworkBundle\FrameworkBundle(),
            new Symfony\Bundle\SecurityBundle\SecurityBundle(),
            new Symfony\Bundle\TwigBundle\TwigBundle(),
            new Symfony\Bundle\MonologBundle\MonologBundle(),
            new Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle(),
            new Symfony\Bundle\AsseticBundle\AsseticBundle(),
            new Doctrine\Bundle\DoctrineBundle\DoctrineBundle(),
            new Sensio\Bundle\FrameworkExtraBundle\SensioFrameworkExtraBundle(),
            new BambukCms\PageBundle\BambukCmsPageBundle(),
        	new Doctrine\Bundle\FixturesBundle\DoctrineFixturesBundle(),
            new Doctrine\Bundle\MigrationsBundle\DoctrineMigrationsBundle(),
        	new Stof\DoctrineExtensionsBundle\StofDoctrineExtensionsBundle(),
        	new FOS\UserBundle\FOSUserBundle(),
        	new Sonata\jQueryBundle\SonatajQueryBundle(),
            new Sonata\CoreBundle\SonataCoreBundle(),
        	new Sonata\AdminBundle\SonataAdminBundle(),
        	new Sonata\BlockBundle\SonataBlockBundle(),
        	new Sonata\DoctrineORMAdminBundle\SonataDoctrineORMAdminBundle(),
        	new Knp\Bundle\MenuBundle\KnpMenuBundle(),
        	new Sonata\UserBundle\SonataUserBundle('FOSUserBundle'),
        	new Sonata\EasyExtendsBundle\SonataEasyExtendsBundle(),
        	new Application\Sonata\UserBundle\ApplicationSonataUserBundle(),
            new BambukCms\PostBundle\BambukCmsPostBundle(),
            new A2lix\TranslationFormBundle\A2lixTranslationFormBundle(),
            new Stfalcon\Bundle\TinymceBundle\StfalconTinymceBundle(),
            new Ladela\PersonalTranslationsWidgetBundle\PersonalTranslationsWidgetBundle(),
        	new FM\ElfinderBundle\FMElfinderBundle(),
        	new JMS\TranslationBundle\JMSTranslationBundle(),
            new BambukCms\ContentBundle\BambukCmsContentBundle(),
            new Oneup\UploaderBundle\OneupUploaderBundle(),
            new BambukCms\ClubBundle\BambukCmsClubBundle(),
            new BambukCms\SliderBundle\BambukCmsSliderBundle(),
            new BambukCms\BannerBundle\BambukCmsBannerBundle(),
        );
        if (in_array($this->getEnvironment(), array('dev', 'test'))) {
            $bundles[] = new Acme\DemoBundle\AcmeDemoBundle();
            $bundles[] = new Symfony\Bundle\WebProfilerBundle\WebProfilerBundle();
            $bundles[] = new Sensio\Bundle\DistributionBundle\SensioDistributionBundle();
            $bundles[] = new Sensio\Bundle\GeneratorBundle\SensioGeneratorBundle();
        }

        return $bundles;
    }
	public function init()
    {
        bcscale(3);
    }
    public function registerContainerConfiguration(LoaderInterface $loader)
    {
        $loader->load(__DIR__.'/config/config_'.$this->getEnvironment().'.yml');
    }
}
