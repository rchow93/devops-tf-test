#!/bin/bash

sudo apt-get -y update
sudo apt-get install -y apache2
sudo chown ubuntu /var/www/html/index.html
sudo service apache2 stop
sudo rm /var/www/html/index.html

sudo cat << 'EOF' >> /var/www/html/index.html
<p>I better learn the below for NZ!</p>
      <p>Good Beer</p>
      <img src="http://foo.ourdevops.com/NZ_Beer.png" alt="NZ Beer" style="width:200px;height:200px;">
      <p>New Zealand History:</p>
      <section id="block-views-1c61f3b497882dc7ef4e6919ab132396" class="block block-views">
      <div class="view view-page-title-intro-text-edits view-id-page_title_intro_text_edits view-display-id-block_2 page-title view-dom-id-1386c6aa6e53d722e8be17f6367a5a76">
      <div class="view-content">
      <div class="item active">
      <div>
      <h1>A brief history</h1>
      </div>
      <div class="views-field views-field-field-introduction-text-revision-id">
      <p class="field-content intro">New Zealand is a young country, in both geological and human terms.</p>
      </div>
      </div>
      </div>
      </div>
      </section>
      <section id="block-system-main" class="block block-system">
      <div class="ds-1col node node-page view-mode-full">
      <div class="field field-name-body field-type-text-with-summary field-label-hidden">
      <div class="field-items">
      <div class="field-item even">
      <p>In fact, New Zealand was&nbsp;the last large and&nbsp;habitable place in the world to be discovered.<br />
      <p>Māori ancestors were the first settlers in New Zealand.</p>
      </p>
      <h2>Māori settlement</h2>
      <p>First to arrive were ancestors of Māori. The first settlers probably arrived from Polynesia between 1200 and 1300 AD. They discovered New Zealand as they explored the Pacific, navigating by ocean currents and the winds and stars.</p>
      <p>In some traditions, the navigator credited with discovering New Zealand is Kupe.</p>
      <h2>The first Europeans</h2>
      <h3>The Dutch</h3>
      <p>The first European to arrive in&nbsp;New Zealand was the Dutch explorer Abel Tasman in 1642. That is how we got the Dutch-sounding name - from a Dutch mapmaker who first called us Nieuw Zeeland.</p>
      <h3>British and French</h3>
      <p>A surprisingly long time passed - 127 years - before New Zealand was visited by another European, Captain James Cook. He came in 1769 on the first of three voyages.</p>
      <p>European whalers and sealers started visiting regularly and then came traders.</p>
      <p>By the 1830s, the British government was being pressured to curb lawlessness in the country and also to pre-empt the French who were considering&nbsp;New Zealand as a potential colony.</p>
      <h2>Treaty of Waitangi signed</h2>
      <p>Eventually, at Waitangi on 6 February 1840, William Hobson, New Zealand&rsquo;s first Governor, invited assembled Māori chiefs to sign a treaty with the British Crown.</p>
      <p>The treaty was taken all round the country, as far south as Foveaux Strait, for signing by local chiefs. Eventually, more than 500 chiefs signed the treaty - now known as the Treaty of Waitangi.</p>
      <p>For more information, see our Treaty of Waitangi page.</p>
      <p><a href="https://www.newzealandnow.govt.nz/living-in-nz/history-government/the-treaty-of-waitangi" target="_blank" rel="noopener">About the Treaty of Waitangi</a></p>
      <div class="panel pull-out lg">
      <div class="panel-body">
      <p>The term 'Māori' did not exist until the Europeans arrived. It means 'ordinary' and Māori used it to distinguish themselves from the new, fair skinned settlers.&nbsp;</p>
      </div>
      </div>
      <h2>The New Zealand wars</h2>
      <p>Māori came under increasing pressure from Europen settlers to sell their land for settlement. This led to conflict and, in the 1860s, war broke out in the North Island.</p>
      <p>Much&nbsp;Māori&nbsp;land was confiscated or bought during or after 20 years of war.</p>
      <p><a href="https://teara.govt.nz/en/new-zealand-wars" target="_blank" rel="noopener">New Zealand wars | Te Ara</a></p>
      <h2>Economic growth</h2>
      <p>Meanwhile, the South Island settlements prospered.</p>
      <ul>
      <li>Sheep farming was established on&nbsp;extensive grasslands and Canterbury became the country&rsquo;s wealthiest province.</li>
      <li>Gold was discovered in Otago in 1861 and then on the West Coast, helping to make Dunedin New Zealand&rsquo;s largest town.</li>
      </ul>
      <p>In the 1870s, the government helped thousands of British people start a new life in New Zealand. Railways were built and towns sprang up or expanded.</p>
      <p>In 1882, the first shipment of frozen meat from New Zealand made it successfully to England. Exporting meat,&nbsp;butter and cheese (chilled) became possible and New Zealand became a key supplier for Britain.</p>
      <p>With an economy based on agriculture, much of the forest&nbsp;that originally covered New Zealand was cleared for&nbsp;farmland.</p>
      <h2>Social change, war and independence</h2>
      <h3>Rights for women and workers</h3>
      <p>In 1893, New Zealand became the first country in the world to grant all women the right to vote.</p>
      <p>State pensions and state housing for workers were also offered first in New Zealand.</p>
      <h3>South African war</h3>
      <p>We were proudly loyal to the British Empire and sent troops to fight for Britain in the South African War in 1899.</p>
      <h3>New Zealand becomes a dominion</h3>
      <p>We were also increasingly conscious of our own nationalism. In 1901, we declined the chance to join the Australian Federation.&nbsp;Instead, New Zealand became an independent 'dominion' in 1907.</p>
      <h3>World War I and the ANZACs</h3>
      <p>Thousands of New Zealanders served, and died, overseas in the First World War.</p>
      <p>The 1915 landing at Gallipoli in Turkey is regarded as a coming of age for our country. It established the&nbsp;tradition of ANZAC (Australian and New Zealand Army Corps) and&nbsp;a pride in New Zealand&rsquo;s military achievement and its special relationship with Australia.</p>
      <p>ANZAC Day, commemorating the Gallipoli landing, is a public holiday on April 25 each year and is marked with increasingly well-attended ceremonies. To explain the history of the day and its significance to New Zealand today,&nbsp;WW100 has created brief guides, translated into 3 languages.</p>
      <p><a href="http://ww100.govt.nz/a-guide-to-anzac-day?utm_source=newzealandnow.govt.nz" target="_blank" rel="noopener">A guide to ANZAC day | WW100</a></p>
      <h3>World War II</h3>
      <p>New Zealand troops fought overseas again in the Second World War in support of the UK. However, the fall of Singapore shook New Zealanders&rsquo; confidence that Britain could guarantee the country&rsquo;s security.</p>
      <p>With the bulk of our forces effectively stranded in Egypt and the Middle East, it was the United States that protected New Zealand against Japan during the war in the Pacific.</p>
      <h3>Korean and Vietnam wars</h3>
      <p>Keeping on side with America encouraged New Zealand to fight in Korea in the 1950s and - against much popular opposition - in Vietnam in the 1960s.</p>
      <h2>Expanding trade and cultural diversity</h2>
      <h3>Trade</h3>
      <p>When Britain joined the European Economic Community in 1973, New Zealand had already begun diversifying its export trade.</p>
      <p>Losing such an important and assured market for our farm products was a blow. That event has encouraged New Zealand to widen its outlook. We now sell our farm goods and many other exports to a wide range of countries.</p>
      <h3>Culture</h3>
      <p>Culturally, we have also become more diverse. Particularly from the 1980s, a wide range of ethnic groups have been encouraged to settle here and New Zealand is now much more multicultural.</p>
      <p>According to data from the most recent national Census (2013), 25% of people living in New Zealand were born abroad, 15% are Māori, over 12% are Asian and over 7% are from Pacific Islands nations.</p>
      <p>Hindi is the fourth most common language in New Zealand, after English, Māori and Samoan.</p>
      <h2>More information</h2>
      <p>New Zealand History online provides more in-depth information on New Zealand's history.</p>
      </div>
      </div>
      </div>
      </div>
      </section>
EOF


sudo service apache2 start