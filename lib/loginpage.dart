 Container(
                  height: MediaQuery.of(context).size.height * 0.535,
                  width: MediaQuery.of(context).size.width,
                  child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        currentIndex = page;
                      });
                    },
                    controller: _pageController,
                    children: <Widget>[
                      Image.network(
                        'https://static.fibre2fashion.com/MemberResources/LeadResources/4/2013/11/Seller/1364810/Images/1364810_1_mens%20casual%20shoes%20in%20artificial%20with%20design.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://m.media-amazon.com/images/I/51DHAE4Kh2S._AC_UL320_.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://img.joomcdn.net/cbc5ad8167e1e6c719e3b2a69984b8643803254b_original.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://5.imimg.com/data5/HC/YI/AE/SELLER-109305874/ladies-bags-tommy-hilfiger--500x500.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://img.tatacliq.com/images/i7/437Wx649H/MP000000009451171_437Wx649H_202104280331211.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://sc04.alicdn.com/kf/HTB1AsaYasfrK1Rjy0Fmq6xhEXXaA.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.network(
                        'https://m.media-amazon.com/images/I/71jwuJAU-PL._UL1500_.jpg',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),