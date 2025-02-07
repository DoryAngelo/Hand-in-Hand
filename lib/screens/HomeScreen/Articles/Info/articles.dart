import 'source.dart';

List<ArticleContents> articleContents = [article0, article1];

ArticleContents article0 = new ArticleContents.fundraiser('Fund our Farmers',
    'handinhand', Date(30, 11, 2023), 'assets/images/placer.png', <ArticleBody>[
  ArticleBody.noImage(
      'Sub-Title',
      'The bush began to shake. Brad couldnt see what was '
          'causing it to shake, but he didnt care. he had a pretty good '
          'idea about what was going on and what was happening. He was so '
          'confident that he approached the bush carefree and with a smile '
          'on his face. That all changed the instant he realized what was '
          'actually behind the bush.')
]);

ArticleContents article1 = new ArticleContents.volunteer(
    'Volunteer for Public Schools in Bicol',
    'handinhand',
    Date(30, 11, 2023),
    'assets/images/placer.png', <ArticleBody>[
  ArticleBody.noImage(
      'Subtitle',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
          ' Nunc nec lectus id augue viverra sodales nec eget odio.'
          ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
          ' In vitae convallis leo, ac accumsan neque.'),
  ArticleBody.imageOnly('assets/images/placer.png'),
  ArticleBody.paragraphOnly(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
      ' Nunc nec lectus id augue viverra sodales nec eget odio.'
      ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
      ' In vitae convallis leo, ac accumsan neque.'),
  ArticleBody(
      'Subtitle 2',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
          ' Nunc nec lectus id augue viverra sodales nec eget odio.'
          ' Nam hendrerit tellus et enim condimentum, ac ultrices felis ullamcorper.'
          ' In vitae convallis leo, ac accumsan neque.',
      'assets/images/placer.png')
]);
